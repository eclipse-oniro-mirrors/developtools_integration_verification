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
expected_out_1: "Semantic error ESE0143: Unresolved reference eval"
---*/

function checkIsRedeclarationError(code: string) {
  try {
    eval(`
checkIsRedeclarationError : {
  break checkIsRedeclarationError;
${code}
}
`);
    arktest.assertTrue(false);
  } catch(e) {
    arktest.assertTrue(e instanceof SyntaxError );
    arktest.assertTrue( e.toString().indexOf('has already been declared') >= 0 );
  }
}

function checkIsNotRedeclarationError(code: string) {
  try {
    eval(`
checkIsNotRedeclarationError_label : {
  break checkIsNotRedeclarationError_label;
${code}
}
`);
  } catch (e) {
    arktest.assertTrue(false, 'unexpected redeclaration error');
  }
}


let lexicalE = [
  'let e',
  'let f, g, e',
  'let [f] = [], [] = [], e = e, h',
  'let {e} = 0',
  'let {f, e} = 0',
  'let {f, g} = 0, {e} = 0',
  'let {f = 0, e = 1} = 0',
  'let [e] = 0',
  'let [f, e] = 0',
  'let {f:e} = 0',
  'let [[[], e]] = 0',
  'const e = 0',
  'const f = 0, g = 0, e = 0',
  'const {e} = 0',
  'const [e] = 0',
  'const {f:e} = 0',
  'const [[[], e]] = 0',
  'function e(){}',
  'function* e(){}',
];

let notLexicalE = [
  'let e',
  'let f, e',
  'let {e} = 0',
  'let {} = 0',
  'let {e:f} = 0',
  '{ function e(){} }'
];

// Check that lexical declarations cannot override a simple catch parameter
for (let declaration of lexicalE) {
  checkIsRedeclarationError(`
try {
  throw 0;
} catch(e) {
  ${declaration}
}
`);
}

// Check that lexical declarations cannot override a complex catch parameter
for (let declaration of lexicalE) {
  checkIsRedeclarationError(`
try {
  throw 0;
} catch({e}) {
  ${declaration}
}
`);
}

// Check that non-lexical declarations can override a simple catch parameter
for (let declaration of notLexicalE) {
  checkIsNotRedeclarationError(`
try {
  throw 0;
} catch(e) {
  ${declaration}
}
`);
}

// Check that the above error does not occur if a declaration scope is between
// the catch and the loop.
for (let declaration of lexicalE) {
  checkIsNotRedeclarationError(`
try {
  throw 0;
} catch(e) {
  (()=>{${declaration}})();
}
`);

  checkIsNotRedeclarationError(`
try {
  throw 0;
} catch(e) {
  (function(){${declaration}})();
}
`);
}
