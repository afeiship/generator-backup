var assert = require('assert');
var nx = require('next-js-core2');
require('../src/next-qs');

describe('next/qs', function () {

  it('nx.qs', function () {
    var url = '?auctionId=4713&v=1.0.76730bc3'

    assert.equal(nx.qs('auctionId',url), '4713');
    assert.equal(nx.qs('v',url), '1.0.76730bc3');
  });

});
