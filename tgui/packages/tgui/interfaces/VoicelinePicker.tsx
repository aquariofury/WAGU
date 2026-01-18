import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Box, Button, Icon, Section, Stack, Tooltip } from 'tgui/components';
import { Window } from 'tgui/layouts';

type VoicelinePickerData = {
  categories: Category[];
  selected: Record<string, string[]>;
};

type Category = {
  key: string;
  name: string;
  description: string;
  sounds: Sound[];
};

type Sound = {
  path: string;
  name: string;
};

export const VoicelinePicker = () => {
  const { data } = useBackend<VoicelinePickerData>();
  const { categories, selected } = data;

  const [activeCategory, setActiveCategory] = useState(categories[0]);

  const getSelectedCount = (categoryKey: string) => {
    return selected[categoryKey]?.length || 0;
  };

  const getTotalCount = (categoryKey: string) => {
    const category = categories.find((c) => c.key === categoryKey);
    return category?.sounds.length || 0;
  };

  return (
    <Window width={700} height={550} theme="crtblue">
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Section>
              <Stack wrap>
                {categories.map((category) => (
                  <Stack.Item key={category.key}>
                    <Button
                      selected={activeCategory.key === category.key}
                      onClick={() => setActiveCategory(category)}
                    >
                      {category.name} ({getSelectedCount(category.key)}/
                      {getTotalCount(category.key)})
                    </Button>
                  </Stack.Item>
                ))}
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <CategoryPanel category={activeCategory} />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const CategoryPanel = (props: { readonly category: Category }) => {
  const { category } = props;
  const { act, data } = useBackend<VoicelinePickerData>();
  const { selected } = data;

  const selectedSounds = selected[category.key] || [];
  const allSelected = selectedSounds.length === category.sounds.length;

  return (
    <Section
      fill
      scrollable
      title={
        <Stack>
          <Stack.Item grow>
            {category.name}
            <Box as="span" ml={1} color="label">
              - {category.description}
            </Box>
          </Stack.Item>
        </Stack>
      }
      buttons={
        <Stack>
          <Stack.Item>
            <Button
              icon="check-double"
              onClick={() => act('select_all', { category: category.key })}
              disabled={allSelected}
            >
              Select All
            </Button>
          </Stack.Item>
          <Stack.Item>
            <Button
              icon="trash"
              color="bad"
              onClick={() => act('clear', { category: category.key })}
              disabled={selectedSounds.length === 0}
            >
              Clear
            </Button>
          </Stack.Item>
        </Stack>
      }
    >
      <Stack vertical>
        {category.sounds.map((sound) => (
          <Stack.Item key={sound.path}>
            <SoundRow
              sound={sound}
              categoryKey={category.key}
              isSelected={selectedSounds.includes(sound.path)}
            />
          </Stack.Item>
        ))}
      </Stack>
    </Section>
  );
};

const SoundRow = (props: {
  readonly sound: Sound;
  readonly categoryKey: string;
  readonly isSelected: boolean;
}) => {
  const { sound, categoryKey, isSelected } = props;
  const { act } = useBackend<VoicelinePickerData>();

  return (
    <Box
      p={1}
      backgroundColor={isSelected ? 'rgba(0, 100, 0, 0.3)' : 'transparent'}
      style={{
        borderRadius: '3px',
        transition: 'background-color 0.1s',
      }}
    >
      <Stack align="center">
        <Stack.Item>
          <Button.Checkbox
            checked={isSelected}
            onClick={() =>
              act('toggle', { category: categoryKey, sound: sound.path })
            }
          >
            {sound.name}
          </Button.Checkbox>
        </Stack.Item>
        <Stack.Item>
          <Tooltip content="Preview sound">
            <Button
              icon="play"
              circular
              onClick={() => act('preview', { sound: sound.path })}
            />
          </Tooltip>
        </Stack.Item>
      </Stack>
    </Box>
  );
};
