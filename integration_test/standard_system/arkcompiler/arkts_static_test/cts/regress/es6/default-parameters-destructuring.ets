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

function f({value}: Object): int { return value; }


(function TestSloppyEvalScoping() {
  let x = 1;

  function f41({[eval('var x = 2; \'a\'')]: w}, z = x) { return z; }
  arktest.assertEQ(2, f41({}));
  arktest.assertEQ(2, f41({a: 0}));
  function f42({[eval('var x = 2; \'a\'')]: w}, z = eval('x')) { return z; }
  arktest.assertEQ(2, f42({}));
  arktest.assertEQ(2, f42({a: 0}));
  function f43({a: w = eval('var x = 2')}, z = x) { return z; }
  arktest.assertEQ(2, f43({}));
  arktest.assertEQ(1, f43({a: 0}));
  function f44({a: w = eval('var x = 2')}, z = eval('x')) { return z; }
  arktest.assertEQ(2, f44({}));
  arktest.assertEQ(1, f44({a: 0}));

  function f5({a = eval('var x = 2'), b = x}) { return b; }
  arktest.assertEQ(2, f5({}));
  arktest.assertEQ(1, f5({a: 0}));
  function f6({a = eval('var x = 2'), b = eval('x')}) { return b; }
  arktest.assertEQ(2, f6({}));
  arktest.assertEQ(1, f6({a: 0}));
  function f71({[eval('var x = 2; \'a\'')]: w, b = x}) { return b; }
  arktest.assertEQ(2, f71({}));
  arktest.assertEQ(2, f71({a: 0}));
  function f72({[eval('var x = 2; \'a\'')]: w, b = eval('x')}) { return b; }
  arktest.assertEQ(2, f72({}));
  arktest.assertEQ(2, f72({a: 0}));
  function f73({a: w = eval('var x = 2'), b = x}) { return b; }
  arktest.assertEQ(2, f73({}));
  arktest.assertEQ(1, f73({a: 0}));
  function f74({a: w = eval('var x = 2'), b = eval('x')}) { return b; }
  arktest.assertEQ(2, f74({}));
  arktest.assertEQ(1, f74({a: 0}));

  const g41 = ({[eval('var x = 2; \'a\'')]: w}, z = x) => { return z; };
  arktest.assertEQ(2, g41({}));
  arktest.assertEQ(2, g41({a: 0}));
  const g42 = ({[eval('var x = 2; \'a\'')]: w}, z = eval('x')) => { return z; };
  arktest.assertEQ(2, g42({}));
  arktest.assertEQ(2, g42({a: 0}));
  const g43 = ({a: w = eval('var x = 2')}, z = x) => { return z; };
  arktest.assertEQ(2, g43({}));
  arktest.assertEQ(1, g43({a: 0}));
  const g44 = ({a: w = eval('var x = 2')}, z = eval('x')) => { return z; };
  arktest.assertEQ(2, g44({}));
  arktest.assertEQ(1, g44({a: 0}));

  const g5 = ({a = eval('var x = 2'), b = x}) => { return b; };
  arktest.assertEQ(2, g5({}));
  arktest.assertEQ(1, g5({a: 0}));
  const g6 = ({a = eval('var x = 2'), b = eval('x')}) => { return b; };
  arktest.assertEQ(2, g6({}));
  arktest.assertEQ(1, g6({a: 0}));
  const g71 = ({[eval('var x = 2; \'a\'')]: w, b = x}) => { return b; };
  arktest.assertEQ(2, g71({}));
  arktest.assertEQ(2, g71({a: 0}));
  const g72 = ({[eval('var x = 2; \'a\'')]: w, b = eval('x')}) => { return b; };
  arktest.assertEQ(2, g72({}));
  arktest.assertEQ(2, g72({a: 0}));
  const g73 = ({a: w = eval('var x = 2'), b = x}) => { return b; };
  arktest.assertEQ(2, g73({}));
  arktest.assertEQ(1, g73({a: 0}));
  const g74 = ({a: w = eval('var x = 2'), b = eval('x')}) => { return b; };
  arktest.assertEQ(2, g74({}));
  arktest.assertEQ(1, g74({a: 0}));
})();


(function TestStrictEvalScoping() {
  'use strict';
  let x = 1;

  function f41({[eval('var x = 2; \'a\'')]: w}, z = x) { return z; }
  arktest.assertEQ(1, f41({}));
  arktest.assertEQ(1, f41({a: 0}));
  function f42({[eval('var x = 2; \'a\'')]: w}, z = eval('x')) { return z; }
  arktest.assertEQ(1, f42({}));
  arktest.assertEQ(1, f42({a: 0}));
  function f43({a: w = eval('var x = 2')}, z = x) { return z; }
  arktest.assertEQ(1, f43({}));
  arktest.assertEQ(1, f43({a: 0}));
  function f44({a: w = eval('var x = 2')}, z = eval('x')) { return z; }
  arktest.assertEQ(1, f44({}));
  arktest.assertEQ(1, f44({a: 0}));

  function f5({a = eval('var x = 2'), b = x}) { return b; }
  arktest.assertEQ(1, f5({}));
  arktest.assertEQ(1, f5({a: 0}));
  function f6({a = eval('var x = 2'), b = eval('x')}) { return b; }
  arktest.assertEQ(1, f6({}));
  arktest.assertEQ(1, f6({a: 0}));
  function f71({[eval('var x = 2; \'a\'')]: w, b = x}) { return b; }
  arktest.assertEQ(1, f71({}));
  arktest.assertEQ(1, f71({a: 0}));
  function f72({[eval('var x = 2; \'a\'')]: w, b = eval('x')}) { return b; }
  arktest.assertEQ(1, f72({}));
  arktest.assertEQ(1, f72({a: 0}));
  function f73({a: w = eval('var x = 2'), b = x}) { return b; }
  arktest.assertEQ(1, f73({}));
  arktest.assertEQ(1, f73({a: 0}));
  function f74({a: w = eval('var x = 2'), b = eval('x')}) { return b; }
  arktest.assertEQ(1, f74({}));
  arktest.assertEQ(1, f74({a: 0}));
})();
