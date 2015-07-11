var expect = chai.expect;

if (!(typeof MochaWeb === 'undefined')){
  MochaWeb.testOnly(function(){
    describe("Item", function(){
      it("can be created", function(){
        Items.insert({content: 'hello world'});

        expect(Items.find().count()).to.equal(1);

        Items.remove({});
      });
    });
  });
}
