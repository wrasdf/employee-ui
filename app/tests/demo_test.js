const mocha = require('mocha'),
      expect = require("chai").expect;

describe(`First Test`, () => {

  it(`should pass`, () => {
    expect('foo').to.be.a('string');
    expect(true).to.be.true;
  })

})
