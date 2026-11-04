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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function execl(expectation, regexp, subject) {
  if (regexp instanceof String) { regexp = new RegExp(regexp, 'u'); }
  arktest.assertEQ(expectation, regexp.exec(subject));
}

function execs(expectation, regexpSource, subject) {
  execl(expectation, new RegExp(regexpSource, 'u'), subject);
}

// Character ranges.
execl(['A'], /[A-D]/u, 'A');
execs(['A'], '[A-D]', 'A');
execl(['ABCD'], /[A-D]+/u, 'ZABCDEF');
execs(['ABCD'], '[A-D]+', 'ZABCDEF');

execl(['\u{12345}'], /[\u1234-\u{12345}]/u, '\u{12345}');
execs(['\u{12345}'], '[\u1234-\u{12345}]', '\u{12345}');
execl(null, /[^\u1234-\u{12345}]/u, '\u{12345}');
execs(null, '[^\u1234-\u{12345}]', '\u{12345}');

execl(['\u{1234}'], /[\u1234-\u{12345}]/u, '\u{1234}');
execs(['\u{1234}'], '[\u1234-\u{12345}]', '\u{1234}');
execl(null, /[^\u1234-\u{12345}]/u, '\u{1234}');
execs(null, '[^\u1234-\u{12345}]', '\u{1234}');

execl(null, /[\u1234-\u{12345}]/u, '\u{1233}');
execs(null, '[\u1234-\u{12345}]', '\u{1233}');
execl(['\u{1233}'], /[^\u1234-\u{12345}]/u, '\u{1233}');
execs(['\u{1233}'], '[^\u1234-\u{12345}]', '\u{1233}');

execl(['\u{12346}'], /[^\u1234-\u{12345}]/u, '\u{12346}');
execs(['\u{12346}'], '[^\u1234-\u{12345}]', '\u{12346}');
execl(null, /[\u1234-\u{12345}]/u, '\u{12346}');
execs(null, '[\u1234-\u{12345}]', '\u{12346}');

execl(['\u{12342}'], /[\u{12340}-\u{12345}]/u, '\u{12342}');
execs(['\u{12342}'], '[\u{12340}-\u{12345}]', '\u{12342}');
execl(['\u{12342}'], /[\ud808\udf40-\ud808\udf45]/u, '\u{12342}');
execs(['\u{12342}'], '[\ud808\udf40-\ud808\udf45]', '\u{12342}');
execl(null, /[^\u{12340}-\u{12345}]/u, '\u{12342}');
execs(null, '[^\u{12340}-\u{12345}]', '\u{12342}');
execl(null, /[^\ud808\udf40-\ud808\udf45]/u, '\u{12342}');
execs(null, '[^\ud808\udf40-\ud808\udf45]', '\u{12342}');

execl(['\u{ffff}'], /[\u{ff80}-\u{12345}]/u, '\u{ffff}');
execs(['\u{ffff}'], '[\u{ff80}-\u{12345}]', '\u{ffff}');
execl(['\u{ffff}'], /[\u{ff80}-\ud808\udf45]/u, '\u{ffff}');
execs(['\u{ffff}'], '[\u{ff80}-\ud808\udf45]', '\u{ffff}');
execl(null, /[^\u{ff80}-\u{12345}]/u, '\u{ffff}');
execs(null, '[^\u{ff80}-\u{12345}]', '\u{ffff}');
execl(null, /[^\u{ff80}-\ud808\udf45]/u, '\u{ffff}');
execs(null, '[^\u{ff80}-\ud808\udf45]', '\u{ffff}');

const loneHighSurrogate = String.fromCharCode(55296);
const pairedSurrogate = String.fromCodePoint(65536);

  execl([loneHighSurrogate], /[^\u{ff80}-\u{12345}]/u,
        '\uff99' + loneHighSurrogate + 'A');
execs(['\uDC00'], '[^\u{ff80}-\u{12345}]', '\uff99\u{DC00}A');
execl(['\uDC01'], /[\u0100-\u{10ffff}]/u, 'A\uDC01');
execl(['\uDC03'], /[\uDC01-\uDC03]/u, '\uD801\uDC02\uDC03');
execl(['\uD801'], /[\uD801-\uD803]/u, '\uD802\uDC01\uD801');

  execl(null, /[^\u{ff80}-\u{12345}]/u, pairedSurrogate);
  execs(null, '[^\u{ff80}-\u{12345}]', pairedSurrogate);
  execl([pairedSurrogate], /[\u{ff80}-\u{12345}]/u, pairedSurrogate);
  execs([pairedSurrogate], '[\u{ff80}-\u{12345}]', pairedSurrogate);
execl(['foo\u{10e6d}bar'], /foo\ud803\ude6dbar/u, 'foo\u{10e6d}bar');

// Lone surrogates
execl(['\ud801\ud801'], /\ud801+/u, '\ud801\udc01\ud801\ud801');
execl(['\udc01\udc01'], /\udc01+/u, '\ud801\ud801\udc01\udc01\udc01');

execl(['\udc02\udc03A'], /\W\WA/u, '\ud801\udc01A\udc02\udc03A');
execl(['\ud801\ud802'], /\ud801./u, '\ud801\udc01\ud801\ud802');
execl(['\udc02\udc03A'], /[\ud800-\udfff][\ud800-\udfff]A/u,
      '\ud801\udc01A\udc02\udc03A');

// Character classes
execl(null, /\w/u, '\ud801\udc01');
execl(['\ud801'], /[^\w]/, '\ud801\udc01');
execl(['\ud801\udc01'], /[^\w]/u, '\ud801\udc01');
execl(['\ud801'], /\W/, '\ud801\udc01');
execl(['\ud801\udc01'], /\W/u, '\ud801\udc01');

execl(['\ud800X'], /.X/u, '\ud800XaX');
execl(['aX'], /.(?<!\ud800)X/u, '\ud800XaX');
execl(['aX'], /.(?<![\ud800-\ud900])X/u, '\ud800XaX');

execl(null, /[]/u, '\u1234');
execl(['0abc'], /[^]abc/u, '0abc');
execl(['\u1234abc'], /[^]abc/u, '\u1234abc');
execl(['\u{12345}abc'], /[^]abc/u, '\u{12345}abc');

execl(null, /[\u{0}-\u{1F444}]/u, '\ud83d\udfff');

// Backward matches of lone surrogates.
execl(['B', '\ud803A'], /(?<=([\ud800-\ud900]A))B/u,
      '\ud801\udc00AB\udc00AB\ud802\ud803AB');
execl(['B', '\udc00A'], /(?<=([\ud800-\u{10300}]A))B/u,
       '\ud801\udc00AB\udc00AB\ud802\ud803AB');
execl(['B', '\udc11A'], /(?<=([\udc00-\udd00]A))B/u,
      '\ud801\udc00AB\udc11AB\ud802\ud803AB');
execl(['X', '\ud800C'], /(?<=(\ud800\w))X/u,
      '\ud800\udc00AX\udc11BX\ud800\ud800CX');
execl(['C', '\ud800\ud800'], /(?<=(\ud800.))\w/u,
      '\ud800\udc00AX\udc11BX\ud800\ud800CX');
execl(['X', '\udc01C'], /(?<=(\udc01\w))X/u,
      '\ud800\udc01AX\udc11BX\udc01\udc01CX');
execl(['C', '\udc01\udc01'], /(?<=(\udc01.))./u,
      '\ud800\udc01AX\udc11BX\udc01\udc01CX');

const L = '\ud800';
const T = '\udc00';
const X = 'X';

// Test string contains only match.
function testw(expect, src, subject) {
  let re = new RegExp('^' + src + '$', 'u');
  arktest.assertEQ(expect, re.test(subject));
}

// Test string starts with match.
function tests(expect, src, subject) {
  let re = new RegExp('^' + src, 'u');
  arktest.assertEQ(expect, re.test(subject));
}

testw(true, X, X);
testw(true, L, L);
testw(true, T, T);
testw(true, L + T, L + T);
testw(true, T + L, T + L);
testw(false, T, L + T);
testw(false, L, L + T);
testw(true, '.(?<=' + L + ')', L);
testw(true, '.(?<=' + T + ')', T);
testw(true, '.(?<=' + L + T + ')', L + T);
testw(true, '.(?<=' + L + T + ')', L + T);
tests(true, '.(?<=' + T + ')', T + L);
tests(false, '.(?<=' + L + ')', L + T);
tests(false, '.(?<=' + T + ')', L + T);
tests(true, '..(?<=' + T + ')', T + T + L);
tests(true, '..(?<=' + T + ')', X + T + L);
tests(true, '...(?<=' + L + ')', X + T + L);
tests(false, '...(?<=' + T + ')', X + L + T)
tests(true, '..(?<=' + L + T + ')', X + L + T)
tests(true, '..(?<=' + L + T + '(?<=' + L + T + '))', X + L + T);
tests(false, '..(?<=' + L + '(' + T + '))', X + L + T);
tests(false, '.*' + L, X + L + T);
tests(true, '.*' + L, X + L + L + T);
tests(false, '.*' + L, X + L + T + L + T);
tests(false, '.*' + T, X + L + T + L + T);
tests(true, '.*' + T, X + L + T + T + L + T);
