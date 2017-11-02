
# Dummy Device Data for UI development
# TODO - pull from WebUSB?
module.exports = [
  {
    id: 'device_1',
    label: 'Alex\'s AstroKey',
    status_code: 1,
    keys: [
      { id: 'device_1_key_1', config: { type: 'macro', macros: [] } }
      { id: 'device_1_key_2', config: { type: 'text', text_value: 'Hello world!' } }
      { id: 'device_1_key_3', config: { type: 'macro', macros: [] } }
      { id: 'device_1_key_4', config: { type: 'text', text_value: 'Hello, again' } }
      { id: 'device_1_key_5', config: { type: 'macro', macros: [] } }
    ]
  }
]
