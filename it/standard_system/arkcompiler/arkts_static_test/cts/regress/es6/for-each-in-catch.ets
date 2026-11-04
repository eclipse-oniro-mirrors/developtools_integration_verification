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

function checkIsRedeclarationError(code) {
  try {
    eval(`
      checkIsRedeclarationError: {
        break checkIsRedeclarationError;
        ${code}
      }
    `);
    arktest.assertTrue(false, 'expected a SyntaxError');
  } catch (e) {
    arktest.assertTrue(e instanceof SyntaxError);
    arktest.assertTrue(e.toString().includes('has already been declared'));
  }
}

function checkIsNotRedeclarationError(code) {
  arktest.expectNoThrow(() => eval(`
    checkIsNotRedeclarationError_label: {
      break checkIsNotRedeclarationError_label;
      ${code}
    }
  `));
}


let varE = [
  'var e',
  'var {e}',
  'var {f, e}',
  'var [e]',
  'var {f:e}',
  'var [[[], e]]'
];

let notVarE = [
  'var f',
  'var {}',
  'var {e:f}',
  'e',
  '{e}',
  'let e',
  'const e',
  'let {e}',
  'const {e}',
  'let [e]',
  'const [e]',
  'let {f:e}',
  'const {f:e}'
];

// Check that both `for (var ... of ...)` and `for (var ... in ...)`
// can redeclare a simple catch variable.
for (let binding of varE) {
  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      for (${binding} of []) {
        ;
      }
    }
  `);

  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      for (${binding} in []) {
        ;
      }
    }
  `);
}

// Check that the above applies even for nested catches.
for (let binding of varE) {
  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      try {
        throw 1;
      } catch (f) {
        try {
          throw 2;
        } catch ({}) {
          for (${binding} of []) {
            ;
          }
        }
      }
    }
  `);

  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      try {
        throw 1;
      } catch (f) {
        try {
          throw 2;
        } catch ({}) {
          for (${binding} in []) {
            ;
          }
        }
      }
    }
  `);
}

// Check that the above applies if a declaration scope is between the
// catch and the loop.
for (let binding of varE) {
  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      (()=>{for (${binding} of []);})();
    }
  `);

  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      (function() {
        for (${binding} of []) {
          ;
        }
      })();
    }
  `);
}

// Check that there is no error when not declaring a var named e.
for (let binding of notVarE) {
  checkIsNotRedeclarationError(`
    try {
      throw 0;
    } catch (e) {
      for (${binding} of []) {
        ;
      }
    }
  `);
}

// Check that there is an error for both for-in and for-of when redeclaring
// a non-simple catch parameter.
for (let binding of varE) {
  checkIsRedeclarationError(`
    try {
      throw 0;
    } catch ({e}) {
      for (${binding} of []) {
        ;
      }
    }
  `);

  checkIsRedeclarationError(`
    try {
      throw 0;
    } catch ({e}) {
      for (${binding} in []) {
        ;
      }
    }
  `);
}

// Check that the above error occurs even for nested catches.
for (let binding of varE) {
  checkIsRedeclarationError(`
    try {
      throw 0;
    } catch ({e}) {
      try {
        throw 1;
      } catch (f) {
        try {
          throw 2;
        } catch ({}) {
          for (${binding} of []) {
            ;
          }
        }
      }
    }
  `);

  checkIsRedeclarationError(`
    try {
      throw 0;
    } catch ({e}) {
      try {
        throw 1;
      } catch (f) {
        try {
          throw 2;
        } catch ({}) {
          for (${binding} in []) {
            ;
          }
        }
      }
    }
  `);
}
