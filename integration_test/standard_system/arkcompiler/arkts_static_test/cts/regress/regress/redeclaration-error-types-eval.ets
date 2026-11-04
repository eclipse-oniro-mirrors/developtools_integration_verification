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

function doTest(scripts, expectedError) {
  const realm = Realm.create();

  for (let i = 0; i < scripts.length - 1; i++) {
    Realm.eval(realm, scripts[i]);
  }

  Realm.dispose(realm);
}

const tests = [
  {
    // ES#sec-globaldeclarationinstantiation 5.a:
    // If envRec.HasVarDeclaration(name) is true, throw a SyntaxError
    // exception.
    scripts: [
      'var a;',
      'let a;',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-globaldeclarationinstantiation 6.a:
    // If envRec.HasLexicalDeclaration(name) is true, throw a SyntaxError
    // exception.
    scripts: [
      'let a;',
      'var a;',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-globaldeclarationinstantiation 5.b:
    // If envRec.HasLexicalDeclaration(name) is true, throw a SyntaxError
    // exception.
    scripts: [
      'let a;',
      'let a;',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-evaldeclarationinstantiation 5.a.i.1:
    // If varEnvRec.HasLexicalDeclaration(name) is true, throw a SyntaxError
    // exception.
    scripts: [
      'let a; eval("var a;");',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-evaldeclarationinstantiation 5.a.i.1:
    // If varEnvRec.HasLexicalDeclaration(name) is true, throw a SyntaxError
    // exception.
    scripts: [
      'let a; eval("function a() {}");',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-evaldeclarationinstantiation 5.d.ii.2.a.i:
    // Throw a SyntaxError exception.
    scripts: [
      '(function() { let a; eval("var a;"); })();',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-evaldeclarationinstantiation 5.d.ii.2.a.i:
    // Throw a SyntaxError exception.
    scripts: [
      '(function() { let a; eval("function a() {}"); })();',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-globaldeclarationinstantiation 5.d:
    // If hasRestrictedGlobal is true, throw a SyntaxError exception.
    scripts: [
      'let NaN;',
    ],
    expectedError: 'SyntaxError',
  },
  {
    // ES#sec-globaldeclarationinstantiation 5.d:
    // If hasRestrictedGlobal is true, throw a SyntaxError exception.
    scripts: [
      'function NaN() {}',
    ],
    expectedError: 'SyntaxError',
  },

  {
    // ES#sec-evaldeclarationinstantiation 8.a.iv.1.b:
    // If fnDefinable is false, throw a TypeError exception.
    scripts: [
      'eval("function NaN() {}");',
    ],
    expectedError: 'TypeError',
  },
  {
    // ES#sec-evaldeclarationinstantiation 8.a.iv.1.b:
    // If fnDefinable is false, throw a TypeError exception.
    scripts: [
      `
        let a;
        try {
          eval("function a() {}");
        } catch (e) {}
        eval("function NaN() {}");
      `,
    ],
    expectedError: 'TypeError',
  },
  {
    // ES#sec-evaldeclarationinstantiation 8.a.iv.1.b:
    // If fnDefinable is false, throw a TypeError exception.
    scripts: [
      `
        eval("
          function f() {
            function b() {
              (0, eval)('function NaN() {}');
            }
            b();
          }
          f();
        ");
      `.replace(/'/g, \'`\'),
    ],
    expectedError: 'TypeError',
  },
];

tests.forEach(function(test) {
  doTest(test.scripts, test.expectedError);
});'