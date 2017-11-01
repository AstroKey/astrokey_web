
# Dummy Device Data for UI development
# TODO - pull from WebUSB?
module.exports = [
  {
    id: 'device_1',
    label: 'Alex\'s AstroKey',
    status_code: 1,
    keys: [
      {
        id: 'device_1_key_1',
        order: 1,
        label: 'A',
        config: {
          type: 'macro',
          macros: [
            {
              "row": "r2",
              "key": "A",
              "keycode": 65,
              "order": 1,
              "position": 0
            },
            {
              "row": "r2",
              "key": "S",
              "keycode": 83,
              "order": 2,
              "position": 0
            },
            {
              "row": "r3",
              "key": "T",
              "keycode": 84,
              "order": 3,
              "position": 0
            },
            {
              "row": "r3",
              "key": "R",
              "keycode": 82,
              "order": 4,
              "position": 0
            },
            {
              "row": "r3",
              "key": "O",
              "keycode": 79,
              "order": 5,
              "position": 0
            },
            {
              "row": "r2",
              "key": "K",
              "keycode": 75,
              "order": 6,
              "position": 0
            },
            {
              "row": "r3",
              "key": "E",
              "keycode": 69,
              "order": 7,
              "position": 0
            },
            {
              "row": "r3",
              "key": "Y",
              "keycode": 89,
              "order": 8,
              "position": 0
            }
          ]
        }
      }
      { id: 'device_1_key_2', order: 2, label: 'S', config: { type: 'text', text_value: 'Hello world!' } }
      { id: 'device_1_key_3', order: 3, label: 'T', config: { type: 'macro', macros: [] } }
      { id: 'device_1_key_4', order: 4, label: 'R', config: { type: 'text', text_value: 'Hello, again' } }
      { id: 'device_1_key_5', order: 5, label: 'O', config: { type: 'key', key_value: 56 } }
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
