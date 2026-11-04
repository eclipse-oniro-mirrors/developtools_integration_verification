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

// Test for conflicting variable bindings.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

'use strict';

function checkException(e) {
  const string = e.toString();
  arktest.assertTrue(string.indexOf('has already been declared') >= 0 ||
             string.indexOf('redeclaration') >= 0);
  return 'Conflict';
}


function testGlobal(s,e) {
  try {
    return eval(s + e);
  } catch (x) {
    return checkException(x);
  }
}


function testFunction(s,e) {
  try {
    return eval('(function(){' + s + ' return ' + e + '})')();
  } catch (x) {
    return checkException(x);
  }
}


function testBlock(s,e) {
  try {
    return eval('(function(){ {' + s + '} return ' + e + '})')();
  } catch (x) {
    return checkException(x);
  }
}

function testAll(expected,s,optE) {
  let e = '';
  let msg = s;
  if (optE) { e = optE; msg += optE; }
  arktest.assertEQ(expected === 'LocalConflict' ? 'NoConflict' : expected,
      testGlobal(s,e), 'global:\'' + msg + '\'');
  arktest.assertEQ(expected === 'LocalConflict' ? 'NoConflict' : expected,
      testFunction(s,e), 'function:\'' + msg + '\'');
  arktest.assertEQ(expected === 'LocalConflict' ? 'Conflict' : expected,
      testBlock(s,e), 'block:\'' + msg + '\'');
}


function testConflict(s) {
  testAll('Conflict', s);
  testAll('Conflict', 'eval("' + s + '");');
}

function testNoConflict(s) {
  testAll('NoConflict', s, '\'NoConflict\'');
  testAll('NoConflict', 'eval("' + s + '");', '\'NoConflict\'');
}

function testLocalConflict(s) {
  testAll('LocalConflict', s, '\'NoConflict\'');
  testAll('NoConflict', 'eval("' + s + '");', '\'NoConflict\'');
}

const letbinds = [ 'let x;',
                 'let x = 0;',
                 'let x = undefined;',
                 'let x = function() {};',
                 'let x, y;',
                 'let y, x;',
                 'const x = 0;',
                 'const x = undefined;',
                 'const x = function() {};',
                 'const x = 2, y = 3;',
                 'const y = 4, x = 5;',
                 'class x { }',
                 ];
function forCompatible(bind) {
  return !bind.startsWith('class');
}
const varbinds = [ 'var x;',
                 'var x = 0;',
                 'var x = undefined;',
                 'var x = function() {};',
                 'var x, y;',
                 'var y, x;',
                 ];
const funbind = 'function x() {}';

for (let l = 0; l < letbinds.length; ++l) {
  // Test conflicting let/var bindings.
  for (let v = 0; v < varbinds.length; ++v) {
    // Same level.
    testConflict(letbinds[l] + varbinds[v]);
    testConflict(varbinds[v] + letbinds[l]);
    // Different level.
    testConflict(letbinds[l] + '{' + varbinds[v] + '}');
    testConflict('{' + varbinds[v] +'}' + letbinds[l]);
    testNoConflict(varbinds[v] + '{' + letbinds[l] + '}');
    testNoConflict('{' + letbinds[l] + '}' + varbinds[v]);
    // For loop.
    if (forCompatible(letbinds[l])) {
      testConflict('for (' + letbinds[l] + '0;) {' + varbinds[v] + '}');
    }
    testNoConflict('for (' + varbinds[v] + '0;) {' + letbinds[l] + '}');
  }

  // Test conflicting let/let bindings.
  for (let k = 0; k < letbinds.length; ++k) {
    // Same level.
    testConflict(letbinds[l] + letbinds[k]);
    testConflict(letbinds[k] + letbinds[l]);
    // Different level.
    testNoConflict(letbinds[l] + '{ ' + letbinds[k] + '}');
    testNoConflict('{' + letbinds[k] +'} ' + letbinds[l]);
    // For loop.
    if (forCompatible(letbinds[l])) {
      testNoConflict('for (' + letbinds[l] + '0;) {' + letbinds[k] + '}');
    }
    if (forCompatible(letbinds[k])) {
      testNoConflict('for (' + letbinds[k] + '0;) {' + letbinds[l] + '}');
    }
  }

  // Test conflicting function/let bindings.
  // Same level.
  testConflict(letbinds[l] + funbind);
  testConflict(funbind + letbinds[l]);
  // Different level.
  testNoConflict(letbinds[l] + '{' + funbind + '}');
  testNoConflict('{' + funbind + '}' + letbinds[l]);
  testNoConflict(funbind + '{' + letbinds[l] + '}');
  testNoConflict('{' + letbinds[l] + '}' + funbind);
  // For loop.
  if (forCompatible(letbinds[l])) {
    testNoConflict('for (' + letbinds[l] + '0;) {' + funbind + '}');
  }

  // Test conflicting parameter/let bindings.
  testConflict('(function(x) {' + letbinds[l] + '})();');
}

// Test conflicting function/var bindings.
for (let v = 0; v < varbinds.length; ++v) {
  // Same level.
  testLocalConflict(varbinds[v] + funbind);
  testLocalConflict(funbind + varbinds[v]);
  // Different level.
  testLocalConflict(funbind + '{' + varbinds[v] + '}');
  testLocalConflict('{' + varbinds[v] +'}' + funbind);
  testNoConflict(varbinds[v] + '{' + funbind + '}');
  testNoConflict('{' + funbind + '}' + varbinds[v]);
  // For loop.
  testNoConflict('for (' + varbinds[v] + '0;) {' + funbind + '}');
}

// Test conflicting catch/var bindings.
for (let v = 0; v < varbinds.length; ++v) {
  testNoConflict('try {} catch(x) {' + varbinds[v] + '}');
}

// Test conflicting parameter/var bindings.
for (let v = 0; v < varbinds.length; ++v) {
  testNoConflict('(function (x) {' + varbinds[v] + '})();');
}

// Test conflicting parameter/function bindings.
testNoConflict('(function (x) {' + funbind + '})();');
