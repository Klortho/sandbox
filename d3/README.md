# D3 notes

Run `./setup.sh` to download the libraries.

Many of these examples are derived from [this 
tutorial](http://code.hazzens.com/d3tut/lesson_1.html).

## Links

* [Tutorial](http://code.hazzens.com/d3tut/)
* [Videos](https://www.youtube.com/user/d3Vienno/videos) - these are pretty good
* [Documentation](https://github.com/mbostock/d3/wiki) - on GitHub wiki (or in 
  [devdocs.io](http://devdocs.io/d3/))
* [API Reference](https://github.com/mbostock/d3/wiki/API-Reference)

* Selections:
    * [Reference documentation](https://github.com/mbostock/d3/wiki/Selections)
    * [How selections work](http://bost.ocks.org/mike/selection/)

* Examples:
    * This sandbox repo, deployed [here](http://chrismaloney.org/sandbox/d3/README.md)
      and [here](http://jatspan.org/temp/sandbox/d3/README.md)
    * [Eric Weitz’ ideograms](https://github.com/eweitz/ideogram)
    * [d3-flextree](https://github.com/klortho/d3-flextree); 
      [demo](http://klortho.github.io/d3-flextree/)
    * [dtd-diagram](https://github.com/klortho/dtd-diagram) - see
      the branch [simple-d3-demo](https://github.com/klortho/dtd-diagram/tree/simple-d3-demo); deployed [here](http://chrismaloney.org/dtd-diagram/) and
      [here](http://jatspan.org/temp/dtd-diagram/)




## Examples

***Hello world***

[hello_world.html](hello_world.html)


***Select and style a set of nodes***

[select_all.html](select_all.html)


***Zebra stripe a table***

[zebra.html](zebra.html)


***Create a new table cell in each row***

[create_cells.html](create_cells.html)


***Binding data***

[bind.html](bind.html)


***Enter selection***

[enter.html](enter.html)


***SVG bar chart***

[bar.html](bar.html)


***Animation***

[animation1.html](animation1.html); uses [animation1.js](animation1.js)


***Animation with Promises***

[animation-promises.html](animation-promises.html); uses
[animation-promises.js](animation-promises.js)


***Update pattern***

[update-pattern.html](update-pattern.html)

Remember:

* Update - There was a matching element for a given datum.
* Enter - There was no matching element for a given datum.
* Exit - There was no matching datum for a given element.

See also this block:
[General update pattern, I](http://bl.ocks.org/mbostock/3808218)

