
# Dummy Device Data for UI development
# TODO - pull from WebUSB
module.exports = [
  {
    id: 'device_1',
    label: 'Alex\'s AstroKey',
    status_code: 1,
    keys: [
      { id: 'device_1_key_1', order: 1, label: 'A', config: { type: 'hotkey' } }
      { id: 'device_1_key_2', order: 2, label: 'S', config: { type: 'text' } }
      { id: 'device_1_key_3', order: 3, label: 'T', config: { type: 'hotkey' } }
      { id: 'device_1_key_4', order: 4, label: 'R', config: { type: 'text' } }
      { id: 'device_1_key_5', order: 5, label: 'O', config: { type: 'hotkey' } }
    ]
  },
  {
    id: 'device_2',
    label: 'Alex\'s OTHER AstroKey',
    status_code: 1,
    keys: [
      { id: 'device_2_key_1', order: 1, label: 'A', config: { type: 'text' } }
      { id: 'device_2_key_2', order: 2, label: 'S', config: { type: 'text' } }
      { id: 'device_2_key_3', order: 3, label: 'T', config: { type: 'text' } }
      { id: 'device_2_key_4', order: 4, label: 'R', config: { type: 'text' } }
      { id: 'device_2_key_5', order: 5, label: 'O', config: { type: 'text' } }
    ]
  }
]
