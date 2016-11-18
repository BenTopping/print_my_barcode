import { moduleForModel, test } from 'ember-qunit';

moduleForModel('label-template', 'Unit | Model | label template', {
  // Specify the other units that are required for this test.
  needs: ['model:label-type', 'model:label']
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});