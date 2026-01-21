import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Box, Button, Section, Stack, Tooltip } from 'tgui/components';
import { Window } from 'tgui/layouts';

type VoicelinePickerData = {
  categories: Category[];
  selected: Record<string, string[]>;
  enable_rare_sounds: boolean;
};

type Category = {
  key: string;
  name: string;
  description: string;
  sounds: Sound[];
  rare_sounds: Sound[];
};

type Sound = {
  path: string;
  name: string;
  rare: boolean;
};

export const VoicelinePicker = () => {
  const { act, data } = useBackend<VoicelinePickerData>();
  const { categories, selected, enable_rare_sounds } = data;

  const [activeCategory, setActiveCategory] = useState(categories[0]);

  const getSelectedCount = (categoryKey: string) => {
    return selected[categoryKey]?.length || 0;
  };

  const getTotalCount = (categoryKey: string) => {
    const category = categories.find((c) => c.key === categoryKey);
    let total = category?.sounds.length || 0;
    if (enable_rare_sounds && category?.rare_sounds) {
      total += category.rare_sounds.length;
    }
    return total;
  };

  return (
    <Window width={700} height={550} theme="crtblue">
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Section>
              <Stack wrap align="center">
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
                <Stack.Item grow />
                <Stack.Item>
                  <Tooltip content="When enabled, rare sounds have a small chance to play randomly">
                    <Button.Checkbox
                      checked={enable_rare_sounds}
                      onClick={() => act('toggle_rare_sounds')}
                    >
                      Enable Rare Sounds
                    </Button.Checkbox>
                  </Tooltip>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <CategoryPanel
              category={activeCategory}
              enableRareSounds={enable_rare_sounds}
            />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const CategoryPanel = (props: {
  readonly category: Category;
  readonly enableRareSounds: boolean;
}) => {
  const { category, enableRareSounds } = props;
  const { act, data } = useBackend<VoicelinePickerData>();
  const { selected } = data;

  const selectedSounds = selected[category.key] || [];
  const totalSounds =
    category.sounds.length +
    (enableRareSounds ? category.rare_sounds?.length || 0 : 0);
  const allSelected = selectedSounds.length === totalSounds;

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
        {enableRareSounds &&
          category.rare_sounds?.map((sound) => (
            <Stack.Item key={sound.path}>
              <SoundRow
                sound={sound}
                categoryKey={category.key}
                isSelected={selectedSounds.includes(sound.path)}
                isRare
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
  readonly isRare?: boolean;
}) => {
  const { sound, categoryKey, isSelected, isRare } = props;
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
            {isRare && (
              <Box as="span" ml={1} color="gold">
                (Rare)
              </Box>
            )}
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
