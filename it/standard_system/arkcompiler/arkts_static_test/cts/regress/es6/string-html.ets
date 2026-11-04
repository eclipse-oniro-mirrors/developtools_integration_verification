/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Tests taken from:
// http://mathias.html5.org/tests/javascript/string/

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0127: No matching call signature for anchor(Int)"
---*/

arktest.assertEQ('_'.anchor('b'), '<a name="b">_</a>');
arktest.assertEQ('<'.anchor('<'), '<a name="<"><</a>');
const anchorResult: Any = '_'.anchor(0x2A);
arktest.assertEQ(anchorResult, '<a name="42">_</a>');
arktest.assertEQ('_'.anchor('\x22\x22'), '<a name="&quot;&quot;">_</a>');
arktest.assertEQ('_'.anchor(), '<a name="undefined">_</a>');
arktest.assertEQ(String.prototype.anchor.call(0x2A, 0x2A), '<a name="42">42</a>');
arktest.expectThrow(function() {
  String.prototype.anchor.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.anchor.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.anchor.length, 1);

arktest.assertEQ('_'.big(), '<big>_</big>');
arktest.assertEQ('<'.big(), '<big><</big>');
arktest.assertEQ(String.prototype.big.call(0x2A), '<big>42</big>');
arktest.expectThrow(function() {
  String.prototype.big.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.big.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.big.length, 0);

arktest.assertEQ('_'.blink(), '<blink>_</blink>');
arktest.assertEQ('<'.blink(), '<blink><</blink>');
arktest.assertEQ(String.prototype.blink.call(0x2A), '<blink>42</blink>');
arktest.expectThrow(function() {
  String.prototype.blink.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.blink.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.blink.length, 0);

arktest.assertEQ('_'.bold(), '<b>_</b>');
arktest.assertEQ('<'.bold(), '<b><</b>');
arktest.assertEQ(String.prototype.bold.call(0x2A), '<b>42</b>');
arktest.expectThrow(function() {
  String.prototype.bold.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.bold.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.bold.length, 0);

arktest.assertEQ('_'.fixed(), '<tt>_</tt>');
arktest.assertEQ('<'.fixed(), '<tt><</tt>');
arktest.assertEQ(String.prototype.fixed.call(0x2A), '<tt>42</tt>');
arktest.expectThrow(function() {
  String.prototype.fixed.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.fixed.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.fixed.length, 0);

arktest.assertEQ('_'.fontcolor('b'), '<font color="b">_</font>');
arktest.assertEQ('<'.fontcolor('<'), '<font color="<"><</font>');
arktest.assertEQ('_'.fontcolor(0x2A), '<font color="42">_</font>');
arktest.assertEQ('_'.fontcolor('\x22'), '<font color="&quot;">_</font>');
arktest.assertEQ(String.prototype.fontcolor.call(0x2A, 0x2A),
  '<font color="42">42</font>');
arktest.expectThrow(function() {
  String.prototype.fontcolor.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.fontcolor.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.fontcolor.length, 1);

arktest.assertEQ('_'.fontsize('b'), '<font size="b">_</font>');
arktest.assertEQ('<'.fontsize('<'), '<font size="<"><</font>');
arktest.assertEQ('_'.fontsize(0x2A), '<font size="42">_</font>');
arktest.assertEQ('_'.fontsize('\x22'), '<font size="&quot;">_</font>');
arktest.assertEQ(String.prototype.fontsize.call(0x2A, 0x2A),
  '<font size="42">42</font>');
arktest.expectThrow(function() {
  String.prototype.fontsize.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.fontsize.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.fontsize.length, 1);

arktest.assertEQ('_'.italics(), '<i>_</i>');
arktest.assertEQ('<'.italics(), '<i><</i>');
arktest.assertEQ(String.prototype.italics.call(0x2A), '<i>42</i>');
arktest.expectThrow(function() {
  String.prototype.italics.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.italics.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.italics.length, 0);

arktest.assertEQ('_'.link('b'), '<a href="b">_</a>');
arktest.assertEQ('<'.link('<'), '<a href="<"><</a>');
arktest.assertEQ('_'.link(0x2A), '<a href="42">_</a>');
arktest.assertEQ('_'.link('\x22'), '<a href="&quot;">_</a>');
arktest.assertEQ(String.prototype.link.call(0x2A, 0x2A), '<a href="42">42</a>');
arktest.expectThrow(function() {
  String.prototype.link.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.link.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.link.length, 1);

arktest.assertEQ('_'.small(), '<small>_</small>');
arktest.assertEQ('<'.small(), '<small><</small>');
arktest.assertEQ(String.prototype.small.call(0x2A), '<small>42</small>');
arktest.expectThrow(function() {
  String.prototype.small.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.small.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.small.length, 0);

arktest.assertEQ('_'.strike(), '<strike>_</strike>');
arktest.assertEQ('<'.strike(), '<strike><</strike>');
arktest.assertEQ(String.prototype.strike.call(0x2A), '<strike>42</strike>');
arktest.expectThrow(function() {
  String.prototype.strike.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.strike.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.strike.length, 0);

arktest.assertEQ('_'.sub(), '<sub>_</sub>');
arktest.assertEQ('<'.sub(), '<sub><</sub>');
arktest.assertEQ(String.prototype.sub.call(0x2A), '<sub>42</sub>');
arktest.expectThrow(function() {
  String.prototype.sub.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.sub.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.sub.length, 0);

arktest.assertEQ('_'.sup(), '<sup>_</sup>');
arktest.assertEQ('<'.sup(), '<sup><</sup>');
arktest.assertEQ(String.prototype.sup.call(0x2A), '<sup>42</sup>');
arktest.expectThrow(function() {
  String.prototype.sup.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.sup.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.sup.length, 0);


(function TestToString() {
  let calls = 0;
  const obj = {
    toString() {
      calls++;
      return 'abc';
    },
    valueOf() {
      arktest.assertTrue(false);
    }
  };

  const methodNames = [
    'anchor',
    'big',
    'blink',
    'bold',
    'fixed',
    'fontcolor',
    'fontsize',
    'italics',
    'link',
    'small',
    'strike',
    'sub',
    'sup',
  ];
  for (let name of methodNames) {
    calls = 0;
    String.prototype[name].call(obj);
    arktest.assertEQ(1, calls);
  }
})();


(function TestDeleteStringRelace() {
  arktest.assertEQ('<a name="n">s</a>', 's'.anchor('n'));
  arktest.assertTrue(delete String.prototype.replace);
  arktest.assertEQ('<a name="n">s</a>', 's'.anchor('n'));
})();
