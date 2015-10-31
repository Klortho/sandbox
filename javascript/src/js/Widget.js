// Fleegle.Widget class

// All widgets are created through the Widget.factory() method. This class
// maintains a registry of subclasses, that each have to register themselves.
// Objects are instantiated from a `spec` object, that includes a `type`
// property, that has to match one of the types in the registry.

// This doesn't use standard Javascript inheritance. Instead, it uses a 
// mixin strategy, whereby each concrete subclass mixes in a set of 
// methods from various places into their prototypes.

if (typeof Fleegle != "undefined") {
  (function() {

    var Widget = Fleegle.Widget = {
      // Some constants 
      height: 32,
      width: 50,
    };

    // Registry of subclass constructors
    var subclasses = {};
    Widget.register = function(type, cls) {
      subclasses[type] = cls;
    }

    // The factory constructs a Widget from a specification object.
    Widget.factory = function(fleegle, spec) {
      if (!spec.type) {
        throw new Error("Invalid widget spec, every widget specifier " +
          "must have a type");
      }
      var subclass = subclasses[spec.type];
      if (!subclass) {
        throw new Error("Invalid widget spec, widget type not "
          "recognized: " + spec.type);
      }

      var n = new subclass();
      n.fleegle = fleegle;
      n.initialize();
      return n;
    };

    //////////////////////////////////////////////////////////////////
    // Object methods. Subclasses `extend` their prototypes, to copy
    // these.

    Widget.methods = {
      initialize: function() {},
      is_green: function() { return this.green != null; },
    };

  })();
}

