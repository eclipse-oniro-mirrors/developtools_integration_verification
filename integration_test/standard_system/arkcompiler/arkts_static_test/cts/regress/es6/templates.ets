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

/*---
tags: [compile-only, negative]
expected_out_1: >-
  "Semantic error ESE0174: Cannot infer type for obj because class composite needs an explicit target type"
---*/

const num = 5;
const str = 'str';
function fn() { return 'result'; }
let obj = {
  num: num,
  str: str,
  fn: function() { return 'result'; }
};

(function testBasicExpressions() {
  arktest.assertEQ('foo 5 bar', `foo ${num} bar`);
  arktest.assertEQ('foo str bar', `foo ${str} bar`);
  arktest.assertEQ('foo [object Object] bar', `foo ${obj} bar`);
  arktest.assertEQ('foo result bar', `foo ${fn()} bar`);
  arktest.assertEQ('foo 5 bar', `foo ${obj.num} bar`);
  arktest.assertEQ('foo str bar', `foo ${obj.str} bar`);
  arktest.assertEQ('foo result bar', `foo ${obj.fn()} bar`);
})();

(function testExpressionsContainingTemplates() {
  arktest.assertEQ('foo bar 5', `foo ${`bar ${num}`}`);
})();

(function testMultilineTemplates() {
  arktest.assertEQ('foo\n    bar\n    baz', `foo
    bar
    baz`);

  arktest.assertEQ('foo\n  bar\n  baz', eval('`foo\r\n  bar\r  baz`'));
})();

(function testLineContinuation() {
  arktest.assertEQ('\n', `\

`);
})();

(function testTaggedTemplates() {
  let calls = 0;
  (function(s) {
    calls++;
  })`test`;
  arktest.assertEQ(1, calls);

  calls = 0;
  // assert tag is invoked in right context
  obj = {
    fn: function() {
      calls++;
      arktest.assertEQ(obj, this);
    }
  };

  obj.fn`test`;
  arktest.assertEQ(1, calls);

  calls = 0;
  // Simple templates only have a callSiteObj
  (function(s) {
    calls++;
    arktest.assertEQ(1, arguments.length);
  })`test`;
  arktest.assertEQ(1, calls);

  // Templates containing expressions have the values of evaluated expressions
  calls = 0;
  (function(site, n, s, o, f, r) {
    calls++;
    arktest.assertEQ(6, arguments.length);
    arktest.assertEQ('number', typeof n);
    arktest.assertEQ('string', typeof s);
    arktest.assertEQ('object', typeof o);
    arktest.assertEQ('function', typeof f);
    arktest.assertEQ('result', r);
  })`${num}${str}${obj}${fn}${fn()}`;
  arktest.assertEQ(1, calls);

  // The TV and TRV of NoSubstitutionTemplate :: `` is the empty code unit
  // sequence.
  calls = 0;
  (function(s) {
    calls++;
    arktest.assertEQ(1, s.length);
    arktest.assertEQ(1, s.raw.length);
    arktest.assertEQ('', s[0]);

    // Failure: expected <""> found <"foo  barfoo  barfoo foo foo foo testtest">
    arktest.assertEQ('', s.raw[0]);
  })``;
  arktest.assertEQ(1, calls);

  // The TV and TRV of TemplateHead :: `${ is the empty code unit sequence.
  calls = 0;
  (function(s) {
    calls++;
    arktest.assertEQ(2, s.length);
    arktest.assertEQ(2, s.raw.length);
    arktest.assertEQ('', s[0]);
    arktest.assertEQ('', s.raw[0]);
  })`${1}`;
  arktest.assertEQ(1, calls);

  // The TV and TRV of TemplateMiddle :: }${ is the empty code unit sequence.
  calls = 0;
  (function(s) {
    calls++;
    arktest.assertEQ(3, s.length);
    arktest.assertEQ(3, s.raw.length);
    arktest.assertEQ('', s[1]);
    arktest.assertEQ('', s.raw[1]);
  })`${1}${2}`;
  arktest.assertEQ(1, calls);

  // The TV and TRV of TemplateTail :: }` is the empty code unit sequence.
  calls = 0;
  (function(s) {
    calls++;
    arktest.assertEQ(2, s.length);
    arktest.assertEQ(2, s.raw.length);
    arktest.assertEQ('', s[1]);
    arktest.assertEQ('', s.raw[1]);
  })`${1}`;
  arktest.assertEQ(1, calls);

  // The TV of NoSubstitutionTemplate :: ` TemplateCharacters ` is the TV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('foo', s[0]); })`foo`;
  arktest.assertEQ(1, calls);

  // The TV of TemplateHead :: ` TemplateCharacters ${ is the TV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('foo', s[0]); })`foo${1}`;
  arktest.assertEQ(1, calls);

  // The TV of TemplateMiddle :: } TemplateCharacters ${ is the TV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('foo', s[1]); })`${1}foo${2}`;
  arktest.assertEQ(1, calls);

  // The TV of TemplateTail :: } TemplateCharacters ` is the TV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('foo', s[1]); })`${1}foo`;
  arktest.assertEQ(1, calls);

  // The TV of TemplateCharacters :: TemplateCharacter is the TV of
  // TemplateCharacter.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('f', s[0]); })`f`;
  arktest.assertEQ(1, calls);

  // The TV of TemplateCharacter :: $ is the code unit value 0x0024.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('$', s[0]); })`$`;
  arktest.assertEQ(1, calls);

  // The TV of TemplateCharacter :: \ EscapeSequence is the CV of
  // EscapeSequence.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('안녕', s[0]); })`\uc548\uB155`;
  (function(s) { calls++; arktest.assertEQ('\xff', s[0]); })`\xff`;
  (function(s) { calls++; arktest.assertEQ('\n', s[0]); })`\n`;
  arktest.assertEQ(3, calls);

  // The TV of TemplateCharacter :: LineContinuation is the TV of
  // LineContinuation. The TV of LineContinuation :: \ LineTerminatorSequence is
  // the empty code unit sequence.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('', s[0]); })`\
`;
  arktest.assertEQ(1, calls);

  // The TRV of NoSubstitutionTemplate :: ` TemplateCharacters ` is the TRV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('test', s.raw[0]); })`test`;
  arktest.assertEQ(1, calls);

  // The TRV of TemplateHead :: ` TemplateCharacters ${ is the TRV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('test', s.raw[0]); })`test${1}`;
  arktest.assertEQ(1, calls);

  // The TRV of TemplateMiddle :: } TemplateCharacters ${ is the TRV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('test', s.raw[1]); })`${1}test${2}`;
  arktest.assertEQ(1, calls);

  // The TRV of TemplateTail :: } TemplateCharacters ` is the TRV of
  // TemplateCharacters.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('test', s.raw[1]); })`${1}test`;
  arktest.assertEQ(1, calls);

  // The TRV of TemplateCharacters :: TemplateCharacter is the TRV of
  // TemplateCharacter.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('f', s.raw[0]); })`f`;
  arktest.assertEQ(1, calls);

  // The TRV of TemplateCharacter :: $ is the code unit value 0x0024.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('\u0024', s.raw[0]); })`$`;
  arktest.assertEQ(1, calls);

  // The TRV of EscapeSequence :: 0 is the code unit value 0x0030.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('\u005C\u0030', s.raw[0]); })`\0`;
  arktest.assertEQ(1, calls);

  // The TRV of TemplateCharacter :: \ EscapeSequence is the sequence consisting
  // of the code unit value 0x005C followed by the code units of TRV of
  // EscapeSequence.

  //   The TRV of EscapeSequence :: HexEscapeSequence is the TRV of the
  //   HexEscapeSequence.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('\u005Cxff', s.raw[0]); })`\xff`;
  arktest.assertEQ(1, calls);

  //   The TRV of EscapeSequence :: UnicodeEscapeSequence is the TRV of the
  //   UnicodeEscapeSequence.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('\u005Cuc548', s.raw[0]); })`\uc548`;
  arktest.assertEQ(1, calls);

  //   The TRV of CharacterEscapeSequence :: SingleEscapeCharacter is the TRV of
  //   the SingleEscapeCharacter.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('\u005C\u0027', s.raw[0]); })`\'`;
  (function(s) { calls++; arktest.assertEQ('\u005C\u0022', s.raw[0]); })`\"`;
  (function(s) { calls++; arktest.assertEQ('\u005C\u005C', s.raw[0]); })`\\`;
  (function(s) { calls++; arktest.assertEQ('\u005Cb', s.raw[0]); })`\b`;
  (function(s) { calls++; arktest.assertEQ('\u005Cf', s.raw[0]); })`\f`;
  (function(s) { calls++; arktest.assertEQ('\u005Cn', s.raw[0]); })`\n`;
  (function(s) { calls++; arktest.assertEQ('\u005Cr', s.raw[0]); })`\r`;
  (function(s) { calls++; arktest.assertEQ('\u005Ct', s.raw[0]); })`\t`;
  (function(s) { calls++; arktest.assertEQ('\u005Cv', s.raw[0]); })`\v`;
  (function(s) { calls++; arktest.assertEQ('\u005C`', s.raw[0]); })`\``;
  arktest.assertEQ(10, calls);

  //   The TRV of CharacterEscapeSequence :: NonEscapeCharacter is the CV of the
  //   NonEscapeCharacter.
  calls = 0;
  (function(s) { calls++; arktest.assertEQ('\u005Cz', s.raw[0]); })`\z`;
  arktest.assertEQ(1, calls);

  // The TRV of LineTerminatorSequence :: <LF> is the code unit value 0x000A.
  // The TRV of LineTerminatorSequence :: <CR> is the code unit value 0x000A.
  // The TRV of LineTerminatorSequence :: <CR><LF> is the sequence consisting of
  // the code unit value 0x000A.
  calls = 0;
  function testRawLineNormalization(cs) {
    calls++;
    arktest.assertEQ(cs.raw[0], '\n\n\n');
    arktest.assertEQ(cs.raw[1], '\n\n\n');
  }
  eval('testRawLineNormalization`\r\n\n\r${1}\r\n\n\r`');
  arktest.assertEQ(1, calls);

  // The TRV of LineContinuation :: \ LineTerminatorSequence is the sequence
  // consisting of the code unit value 0x005C followed by the code units of TRV
  // of LineTerminatorSequence.
  calls = 0;
  function testRawLineContinuation(cs) {
    calls++;
    arktest.assertEQ(cs.raw[0], '\u005C\n\u005C\n\u005C\n');
    arktest.assertEQ(cs.raw[1], '\u005C\n\u005C\n\u005C\n');
  }
  eval('testRawLineContinuation`\\\r\n\\\n\\\r${1}\\\r\n\\\n\\\r`');
  arktest.assertEQ(1, calls);
})();


(function testCallSiteObj() {
  let calls = 0;
  function tag(cs) {
    calls++;
    arktest.assertTrue(cs.hasOwnProperty('raw'));
    arktest.assertTrue(Object.isFrozen(cs));
    arktest.assertTrue(Object.isFrozen(cs.raw));
    let raw = Object.getOwnPropertyDescriptor(cs, 'raw');
    arktest.assertFalse(raw.writable);
    arktest.assertFalse(raw.configurable);
    arktest.assertFalse(raw.enumerable);
    arktest.assertEQ(Array.prototype, Object.getPrototypeOf(cs.raw));
    arktest.assertTrue(Array.isArray(cs.raw));
    arktest.assertEQ(Array.prototype, Object.getPrototypeOf(cs));
    arktest.assertTrue(Array.isArray(cs));

    const cooked0 = Object.getOwnPropertyDescriptor(cs, '0');
    arktest.assertFalse(cooked0.writable);
    arktest.assertFalse(cooked0.configurable);
    arktest.assertTrue(cooked0.enumerable);

    const raw0 = Object.getOwnPropertyDescriptor(cs.raw, '0');
    arktest.assertFalse(raw0.writable);
    arktest.assertFalse(raw0.configurable);
    arktest.assertTrue(raw0.enumerable);

    let length = Object.getOwnPropertyDescriptor(cs, 'length');
    arktest.assertFalse(length.writable);
    arktest.assertFalse(length.configurable);
    arktest.assertFalse(length.enumerable);

    length = Object.getOwnPropertyDescriptor(cs.raw, 'length');
    arktest.assertFalse(length.writable);
    arktest.assertFalse(length.configurable);
    arktest.assertFalse(length.enumerable);
  }
  tag`${1}`;
  arktest.assertEQ(1, calls);
})();


(function testUTF16ByteOrderMark() {
  arktest.assertEQ('\uFEFFtest', `\uFEFFtest`);
  arktest.assertEQ('\uFEFFtest', eval('`\uFEFFtest`'));
})();


(function testStringRawAsTagFn() {
  arktest.assertEQ('\\u0065\\`\\r\\r\\n\\ntestcheck',
               String.raw`\u0065\`\r\r\n\n${'test'}check`);
  arktest.assertEQ('\\\n\\\n\\\n', eval('String.raw`\\\r\\\r\n\\\n`'));
  arktest.assertEQ('', String.raw``);
})();


(function testCallSiteCaching() {
  let callSites = [];
  function tag(cs) { callSites.push(cs); }
  let a = 1;
  let b = 2;

  // Call-sites are cached by ParseNode. Same tag call in a loop
  // means same template object
  for (let i = 0; i < 2; ++i) {
    tag`head${i == 0 ? a : b}tail`;
  }
  arktest.assertEQ(2, callSites.length);
  arktest.assertEQ(callSites[0], callSites[1]);

  // Tag calls within eval() never have the same ParseNode as the same tag
  // call from a different eval() invocation.
  for (let i = 0; i < 2; ++i) {
    eval('tag`head${i == 0 ? a : b}tail`');
  }
  arktest.assertEQ(4, callSites.length);
  arktest.assertTrue(callSites[1] !== callSites[2]);
  arktest.assertTrue(callSites[2] !== callSites[3]);

  (new Function('tag', 'a', 'b', 'return tag`head${a}tail`;'))(tag, 1, 2);
  arktest.assertEQ(5, callSites.length);
  arktest.assertTrue(callSites[3] !== callSites[4]);

  (new Function('tag', 'a', 'b', 'return tag`head${b}tail`;'))(tag, 1, 2);
  arktest.assertEQ(6, callSites.length);
  arktest.assertTrue(callSites[4] !== callSites[5]);

  callSites = [];

  tag`foo${a}bar`;
  tag`foo\${.}bar`;
  arktest.assertEQ(2, callSites.length);
  arktest.assertEQ(2, callSites[0].length);
  arktest.assertEQ(1, callSites[1].length);

  callSites = [];

  for (let i = 0; i < 2; ++i) {
    eval('tag`\\\r\n\\\n\\\r`');
  }
  arktest.assertEQ(2, callSites.length);
  arktest.assertTrue(callSites[0] !== callSites[1]);
  arktest.assertEQ('', callSites[0][0]);
  arktest.assertEQ('\\\n\\\n\\\n', callSites[0].raw[0]);

  callSites = [];

  for (let i = 0; i < 2; ++i) {
    tag`\uc548\ub155`;
  }
  arktest.assertEQ(2, callSites.length);
  arktest.assertEQ(callSites[0], callSites[1]);
  arktest.assertEQ('안녕', callSites[0][0]);
  arktest.assertEQ('\\uc548\\ub155', callSites[0].raw[0]);

  callSites = [];

  tag`\uc548\ub155`;
  tag`안녕`;
  arktest.assertEQ(2, callSites.length);
  arktest.assertTrue(callSites[0] !== callSites[1]);
  arktest.assertEQ('안녕', callSites[0][0]);
  arktest.assertEQ('\\uc548\\ub155', callSites[0].raw[0]);
  arktest.assertEQ('안녕', callSites[1][0]);
  arktest.assertEQ('안녕', callSites[1].raw[0]);

  // Extra-thorough UTF8 decoding test.
  callSites = [];

  tag`Iñtër\u006Eâtiônàlizætiøn\u2603\uD83D\uDCA9`;
  tag`Iñtër\u006Eâtiônàlizætiøn☃💩`;

  arktest.assertEQ(2, callSites.length);
  arktest.assertTrue(callSites[0] !== callSites[1]);
  arktest.assertEQ('Iñtër\u006Eâtiônàlizætiøn☃💩', callSites[0][0]);
  arktest.assertEQ(
      'Iñtër\\u006Eâtiônàlizætiøn\\u2603\\uD83D\\uDCA9', callSites[0].raw[0]);
  arktest.assertEQ('Iñtër\u006Eâtiônàlizætiøn☃💩', callSites[1][0]);
  arktest.assertEQ('Iñtër\\u006Eâtiônàlizætiøn☃💩', callSites[1].raw[0]);
})();


(function testExtendedArrayPrototype() {
  Object.defineProperty(Array.prototype, 0, {
    set: function() {
      arktest.assertTrue(false);
    },
    configurable: true
  });
  function tag(){}
  tag`a${1}b`;
  delete Array.prototype[0];
})();


(function testRawLineNormalization() {
  function raw0(callSiteObj) {
    return callSiteObj.raw[0];
  }
  arktest.assertEQ(eval('raw0`\r`'), '\n');
  arktest.assertEQ(eval('raw0`\r\n`'), '\n');
  arktest.assertEQ(eval('raw0`\r\r\n`'), '\n\n');
  arktest.assertEQ(eval('raw0`\r\n\r\n`'), '\n\n');
  arktest.assertEQ(eval('raw0`\r\r\r\n`'), '\n\n\n');
})();


(function testHarmonyUnicode() {
  function raw0(callSiteObj) {
    return callSiteObj.raw[0];
  }
  arktest.assertEQ(raw0`a\u{62}c`, 'a\\u{62}c');
  arktest.assertEQ(raw0`a\u{000062}c`, 'a\\u{000062}c');
  arktest.assertEQ(raw0`a\u{0}c`, 'a\\u{0}c');

  arktest.assertEQ(`a\u{62}c`, 'abc');
  arktest.assertEQ(`a\u{000062}c`, 'abc');
})();


(function testLiteralAfterRightBrace() {
  // Regression test for https://upstream issue tracker/issues/detail?id=3734
  function f() {}
  `abc`;

  function g() {}`def`;

  {
    // block
  }
  `ghi`;

  {
    // block
  }`jkl`;
})();


(function testLegacyOctal() {
  arktest.assertEQ('\u0000', `\0`);
  arktest.assertEQ('\u0000a', `\0a`);
  for (let i = 0; i < 10; i++) {
    let code = '`\\0' + i + '`';
    arktest.expectThrow(code, ((e: Error): boolean => e instanceof SyntaxError));
    // Not an error if tagged.
    code = '(function(){})' + code;
    arktest.expectNoThrow(code, SyntaxError);
  }

  arktest.assertEQ('\\0', String.raw`\0`);
})();


(function testSyntaxErrorsNonEscapeCharacter() {
  arktest.expectThrow('`\\x`', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('`\\u`', ((e: Error): boolean => e instanceof SyntaxError));
  for (let i = 1; i < 8; i++) {
    let code = '`\\' + i + '`';
    arktest.expectThrow(code, ((e: Error): boolean => e instanceof SyntaxError));
    // Not an error if tagged.
    code = '(function(){})' + code;
    arktest.expectNoThrow(code, SyntaxError);
  }
})();


(function testInvalidNumericEscapes() {
  arktest.expectThrow(function() { eval('`\\8`'); }, ((e: Error): boolean => e instanceof SyntaxError))
  arktest.expectThrow(function() { eval('`\\9`'); }, ((e: Error): boolean => e instanceof SyntaxError))
})();


(function testLegacyOctalEscapesInExpressions() {
  // Allowed in sloppy expression
  arktest.assertEQ('\x07', `${'\07'}`);

  // Disallowed in template tail
  arktest.expectThrow('`${"\\07"}\\07`', ((e: Error): boolean => e instanceof SyntaxError));

  // Disallowed in strict expression
  arktest.expectThrow('`${(function() { "use strict"; return "\\07"; })()}`',
               SyntaxError);
})();


const global = this;
(function testCallNew() {
  'use strict';
  let called = false;
  let calledWith;
  global.log = function(x) { called = true; calledWith = x; }

  arktest.assertTrue(new Function`log("test")` instanceof Object);
  arktest.assertTrue(called);
  arktest.assertEQ('test', calledWith);
  delete global.log;
})();


(function testCallNew2() {
  'use strict';
  let log = [];
  function tag(x) {
    log.push(x);
    if (!(this instanceof tag)) {
      return tag;
    }
    this.x = x === void 0 ? null : x;
    return this;
  }
  // No arguments passed to constructor
  let instance = new tag`x``y``z`;
  arktest.assertTrue(instance instanceof tag);
  arktest.assertEQ(tag.prototype, Object.getPrototypeOf(instance));
  arktest.assertEQ({ x: null }, instance);
  arktest.assertEQ([['x'], ['y'], ['z'], undefined], log);

  // Arguments passed to constructor
  log.length = 0;
  instance = new tag`x2` `y2` `z2` (`test`);
  arktest.assertTrue(instance instanceof tag);
  arktest.assertEQ(tag.prototype, Object.getPrototypeOf(instance));
  arktest.assertEQ({ x: 'test' }, instance);
  arktest.assertEQ([['x2'], ['y2'], ['z2'], 'test'], log);
})();


(function testCallResultOfTagFn() {
  'use strict';
  let i = 0;
  let raw = [];
  function tag(cs) {
    let args = Array.prototype.slice.call(arguments);
    const text = String.raw.apply(null, args);
    if (i++ < 2) {
      raw.push('tag;' + text);
      return tag;
    }

    raw.push('raw;' + text);
    return text;
  }
  arktest.assertEQ('test3', tag`test1``test2``test3`);
  arktest.assertEQ([
    'tag;test1',
    'tag;test2',
    'raw;test3'
  ], raw);
})();


(function testReturnValueAsTagFn() {
  'use strict';
  let i = 0;
  function makeTag() {
    return function tag(cs) {
      let args = Array.prototype.slice.call(arguments, 1);
      const rcs = [];
      rcs.raw = cs.map(function(s) {
        return '!' + s + '!';
      });
      args.unshift(rcs);
      return String.raw.apply(null, args);
    }
  }
  arktest.assertEQ('!hi!', makeTag()`hi`);
  arktest.assertEQ('!test!0!test!', makeTag()`test${0}test`);
  arktest.assertEQ('!!', makeTag()``);
});


(function testToStringSubstitutions() {
  let a = {
    toString: function() { return 'a'; },
    valueOf: function() { return '-a-'; }
  };
  let b = {
    toString: function() { return 'b'; },
    valueOf: function() { return '-b-'; }
  };
  arktest.assertEQ('a', `${a}`);
  arktest.assertEQ('ab', `${a}${b}`);
  arktest.assertEQ('-a--b-', `${a + b}`);
  arktest.assertEQ('-a-', `${a + ''}`);
  arktest.assertEQ('1a', `1${a}`);
  arktest.assertEQ('1a2', `1${a}2`);
  arktest.assertEQ('1a2b', `1${a}2${b}`);
  arktest.assertEQ('1a2b3', `1${a}2${b}3`);
})();


(function testToStringSubstitutionsOrder() {
  let subs = [];
  let log = [];
  function getter(name, value) {
    return {
      get: function() {
        log.push('get' + name);
        return value;
      },
      set: function(v) {
        log.push('set' + name);
      }
    };
  }
  Object.defineProperties(subs, {
    0: getter(0, 'a'),
    1: getter(1, 'b'),
    2: getter(2, 'c')
  });

  arktest.assertEQ('-a-b-c-', `-${subs[0]}-${subs[1]}-${subs[2]}-`);
  arktest.assertEQ(['get0', 'get1', 'get2'], log);
})();


(function testTaggedToStringSubstitutionsOrder() {
  let subs = [];
  let log = [];
  const tagged = [];
  function getter(name, value) {
    return {
      get: function() {
        log.push('get' + name);
        return value;
      },
      set: function(v) {
        log.push('set' + name);
      }
    };
  }
  Object.defineProperties(subs, {
    0: getter(0, 1),
    1: getter(1, 2),
    2: getter(2, 3)
  });

  function tag(cs) {
    const nSubstitutions = arguments.length - 1;
    const nCooked = cs.length;
    let e = cs[0];
    let i = 0;
    arktest.assertEQ(nCooked, nSubstitutions + 1);
    while (i < nSubstitutions) {
      const sub = arguments[i++ + 1];
      const tail = cs[i];
      tagged.push(sub);
      e = e.concat(sub, tail);
    }
    return e;
  }

  arktest.assertEQ('-1-2-3-', tag`-${subs[0]}-${subs[1]}-${subs[2]}-`);
  arktest.assertEQ(['get0', 'get1', 'get2'], log);
  arktest.assertEQ([1, 2, 3], tagged);

  tagged.length = 0;
  log.length = 0;
  arktest.assertEQ('-1-', tag`-${subs[0]}-`);
  arktest.assertEQ(['get0'], log);
  arktest.assertEQ([1], tagged);
})();


// Since the first argument to the tag function is always an array,
// eval calls will always just return that array.
(function testEvalTagStrict() {
  'use strict';
  let f = (x) => eval`a${x}b`;
  let result = f();
  arktest.assertEQ(['a', 'b'], result);
  arktest.assertEQ(result, f());
})();


(function testEvalTagSloppy() {
  let f = (x) => eval`a${x}b`;
  let result = f();
  arktest.assertEQ(['a', 'b'], result);
  arktest.assertEQ(result, f());
})();

(function testTaggedTemplateInvalidAssignmentTargetStrict() {
  'use strict';
  function f() {}
  arktest.expectThrow(() => Function('++f`foo`'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('f`foo`++'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('--f`foo`'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('f`foo`--'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('f`foo` = 1'), ((e: Error): boolean => e instanceof SyntaxError));
})();

(function testTaggedTemplateInvalidAssignmentTargetSloppy() {
  function f() {}
  arktest.expectThrow(() => Function('++f`foo`'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('f`foo`++'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('--f`foo`'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('f`foo`--'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(() => Function('f`foo` = 1'), ((e: Error): boolean => e instanceof SyntaxError));
})();

// Disable eval caching if a tagged template occurs in a nested function
let v = 0;
let templates = [];
function tag(callSite) { templates.push(callSite); }
for (v = 0; v < 6; v += 2) {
  eval('(function() { for (var i = 0; i < 2; ++i) tag`Hello${v}world` })()');
  arktest.assertEQ(templates[v], templates[v + 1]);
}
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);

function makeSource1(id) {
  return `function f() {
    for (var i = 0; i < 2; ++i) {
      tag\`Hello${id}world\`;
    }
  }
  f();`;
}
templates = [];
for (v = 0; v < 6; v += 2) {
  eval(makeSource1(v));
  arktest.assertEQ(templates[v], templates[v + 1]);
}
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);

templates = [];
eval('(function() { for (var i = 0; i < 2; ++i) tag`Hello${1}world` })()');
eval('(function() { for (var i = 0; i < 2; ++i) tag`Hello${2}world` })()');
eval('(function() { for (var i = 0; i < 2; ++i) tag`Hello${2}world` })()');
arktest.assertEQ(templates[0], templates[1]);
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertEQ(templates[2], templates[3]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);
arktest.assertEQ(templates[4],templates[5]);

templates = [];
eval(makeSource1(1));
eval(makeSource1(2));
eval(makeSource1(3));
arktest.assertEQ(templates[0], templates[1]);
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertEQ(templates[2], templates[3]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);
arktest.assertEQ(templates[4],templates[5]);

// Disable eval caching if a tagged template occurs in an even deeper nested function
let v = 0;
templates = [];
for (v = 0; v < 6; v += 2) {
    eval('(function() { (function() { for (var i = 0; i < 2; ++i) tag`Hello${v}world` })() })()');
    if (!v) { continue; }
    arktest.assertNE(templates[v], templates[v - 1]);
}
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);

function makeSource2(id) {
  return `function f() {
    function innerF() {
      for (var i = 0; i < 2; ++i) {
        tag\`Hello${id}world\`;
      }
    }
    return innerF();
  }
  f();`;
}
templates = [];
for (v = 0; v < 6; v += 2) {
  eval(makeSource2(v));
  arktest.assertEQ(templates[v], templates[v + 1]);
}
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);

templates = [];
eval('(function() { (function() { for (var i = 0; i < 2; ++i) tag`Hello${1}world` })() })()');
eval('(function() { (function() { for (var i = 0; i < 2; ++i) tag`Hello${2}world` })() })()');
eval('(function() { (function() { for (var i = 0; i < 2; ++i) tag`Hello${2}world` })() })()');
arktest.assertEQ(templates[0], templates[1]);
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertEQ(templates[2], templates[3]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);
arktest.assertEQ(templates[4], templates[5]);

templates = [];
eval(makeSource2(1));
eval(makeSource2(2));
eval(makeSource2(3));
arktest.assertEQ(templates[0], templates[1]);
arktest.assertNE(templates[0], templates[2]);
arktest.assertNE(templates[0], templates[4]);
arktest.assertNE(templates[1], templates[3]);
arktest.assertNE(templates[1], templates[5]);
arktest.assertEQ(templates[2], templates[3]);
arktest.assertNE(templates[2], templates[4]);
arktest.assertNE(templates[3], templates[5]);
arktest.assertEQ(templates[4], templates[5]);

// Template objects should be kept alive even if only held weakly, and should
// preserve values when used as weak keys.
let weakTemplates = new WeakMap();
let weakTaggedValueId = 0;
function weakTag(callSite) {
  if (weakTemplates.has(callSite)) {
    return weakTemplates.get(callSite);
  }
  const value = {id: weakTaggedValueId++};
  weakTemplates.set(callSite, value);
  return value;
}

(function () {
  function valueForTag1(x) {
    return weakTag`Hello${x}world`;
  }
  function valueForTag2(x) {
    return weakTag`Hello${x}world`;
  }
  let valueForTag1One = valueForTag1(1);
  ArkTools.gc();
  ArkTools.gc();
  ArkTools.gc();
  let valueForTag12 = valueForTag1(2);
  let valueForTag20 = valueForTag2(0);
  arktest.assertEQ(valueForTag1One, valueForTag12);
  arktest.assertNE(valueForTag1One, valueForTag20);
})();
