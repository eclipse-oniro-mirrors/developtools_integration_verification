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

// TODO(3468): we rely on a precise Math.exp.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0307: Overloaded method is used as value"
---*/

[Math.sinh, Math.cosh, Math.tanh, Math.asinh, Math.acosh, Math.atanh].
    forEach(function(fun) {
  arktest.assertTrue(isNaN(fun(NaN)));
  arktest.assertTrue(isNaN(fun('abc')));
  arktest.assertTrue(isNaN(fun({})));
  arktest.assertEQ(fun(0), fun([]));
  arktest.assertTrue(isNaN(fun([1, 1])));
  arktest.assertEQ(fun(1.11), fun({ toString: function() { return '1.11'; } }));
  arktest.assertEQ(fun(-3.1), fun({ toString: function() { return -3.1; } }));
  arktest.assertEQ(fun(-1.1), fun({ valueOf: function() { return '-1.1'; } }));
  arktest.assertEQ(fun(3.11), fun({ valueOf: function() { return 3.11; } }));
});


function testId(fun, rev, value) {
  arktest.assertDoubleEQ(1, rev(fun(value))/value, 1E-7);
}

[Math.PI, 2, 5, 1E-5, 0.3].forEach(function(x) {
  testId(Math.sinh, Math.asinh, x);
  testId(Math.sinh, Math.asinh, -x);
  testId(Math.cosh, Math.acosh, x);
  testId(Math.tanh, Math.atanh, x);
  testId(Math.tanh, Math.atanh, -x);
});


[Math.sinh, Math.asinh, Math.tanh, Math.atanh].forEach(function(fun) {
  arktest.assertEQ('-Infinity', String(1/fun(-0)));
  arktest.assertEQ('Infinity', String(1/fun(0)));
});


[Math.sinh, Math.asinh].forEach(function(fun) {
  arktest.assertEQ('-Infinity', String(fun(-Infinity)));
  arktest.assertEQ('Infinity', String(fun(Infinity)));
  arktest.assertEQ('-Infinity', String(fun('-Infinity')));
  arktest.assertEQ('Infinity', String(fun('Infinity')));
});


arktest.assertEQ(Infinity, Math.cosh(-Infinity));
arktest.assertEQ(Infinity, Math.cosh(Infinity));
arktest.assertEQ(Infinity, Math.cosh('-Infinity'));
arktest.assertEQ(Infinity, Math.cosh('Infinity'));


arktest.assertEQ(-Infinity, Math.atanh(-1));
arktest.assertEQ(Infinity, Math.atanh(1));

// Math.atanh(x) is NaN for |x| > 1 and NaN
[1.000000000001, Math.PI, 10000000, 2, Infinity, NaN].forEach(function(x) {
  arktest.assertTrue(isNaN(Math.atanh(-x)));
  arktest.assertTrue(isNaN(Math.atanh(x)));
});


arktest.assertEQ(0, Math.sinh(0));
arktest.assertEQ(-Infinity, 1/Math.sinh(-0));
arktest.assertEQ(1, Math.tanh(Infinity));
arktest.assertEQ(-1, Math.tanh(-Infinity));
arktest.assertEQ(1, Math.cosh(0));
arktest.assertEQ(1, Math.cosh(-0));

arktest.assertEQ(0, Math.acosh(1));
arktest.assertEQ('Infinity', String(Math.acosh(Infinity)));

// Math.acosh(x) is NaN for x < 1
[0.99999999999, 0.2, -1000, 0, -0].forEach(function(x) {
  arktest.assertTrue(isNaN(Math.acosh(x)));
});


// Some random samples.
arktest.assertDoubleEQ(74.20321057778875, Math.sinh(5), 1E-12);
arktest.assertDoubleEQ(-74.20321057778875, Math.sinh(-5), 1E-12);

arktest.assertDoubleEQ(1.1276259652063807, Math.cosh(0.5), 1E-12);
arktest.assertDoubleEQ(74.20994852478785, Math.cosh(5), 1E-12);
arktest.assertDoubleEQ(1.1276259652063807, Math.cosh(-0.5), 1E-12);
arktest.assertDoubleEQ(74.20994852478785, Math.cosh(-5), 1E-12);

arktest.assertDoubleEQ(0.4621171572600, Math.tanh(0.5), 1E-12);
arktest.assertDoubleEQ(0.9999092042625, Math.tanh(5), 1E-12);
arktest.assertDoubleEQ(-0.4621171572600, Math.tanh(-0.5), 1E-12);
arktest.assertDoubleEQ(-0.9999092042625, Math.tanh(-5), 1E-12);

arktest.assertDoubleEQ(0.4812118250596, Math.asinh(0.5), 1E-12);
arktest.assertDoubleEQ(2.3124383412727, Math.asinh(5), 1E-12);
arktest.assertDoubleEQ(-0.4812118250596, Math.asinh(-0.5), 1E-12);
arktest.assertDoubleEQ(-2.3124383412727, Math.asinh(-5), 1E-12);

arktest.assertDoubleEQ(0.9624236501192, Math.acosh(1.5), 1E-12);
arktest.assertDoubleEQ(2.2924316695612, Math.acosh(5), 1E-12);
arktest.assertDoubleEQ(0.4435682543851, Math.acosh(1.1), 1E-12);
arktest.assertDoubleEQ(1.3169578969248, Math.acosh(2), 1E-12);

arktest.assertDoubleEQ(0.5493061443341, Math.atanh(0.5), 1E-12);
arktest.assertDoubleEQ(0.1003353477311, Math.atanh(0.1), 1E-12);
arktest.assertDoubleEQ(-0.5493061443341, Math.atanh(-0.5), 1E-12);
arktest.assertDoubleEQ(-0.1003353477311, Math.atanh(-0.1), 1E-12);

[0, 1E-50, 1E-10, 1E10, 1E50, 1E100, 1E150].forEach(function(x) {
  arktest.assertDoubleEQ(Math.asinh(x), -Math.asinh(-x), 1E-12);
});

[1-(1E-16), 0, 1E-10, 1E-50].forEach(function(x) {
  arktest.assertDoubleEQ(Math.atanh(x), -Math.atanh(-x), 1E-12);
});


// Implementation-specific tests for sinh.
// Case |x| < 2^-28
arktest.assertEQ(Math.pow(2, -29), Math.sinh(Math.pow(2, -29)));
arktest.assertEQ(-Math.pow(2, -29), Math.sinh(-Math.pow(2, -29)));
// Case |x| < 1
arktest.assertEQ(0.5210953054937474, Math.sinh(0.5));
arktest.assertEQ(-0.5210953054937474, Math.sinh(-0.5));
// sinh(10*log(2)) = 1048575/2048, case |x| < 22
arktest.assertEQ(1048575/2048, Math.sinh(10*Math.LN2));
arktest.assertEQ(-1048575/2048, Math.sinh(-10*Math.LN2));
// Case |x| < 22
arktest.assertEQ(11013.232874703393, Math.sinh(10));
arktest.assertEQ(-11013.232874703393, Math.sinh(-10));
// Case |x| in [22, log(maxdouble)]
arktest.assertEQ(2.1474836479999983e9, Math.sinh(32*Math.LN2));
arktest.assertEQ(-2.1474836479999983e9, Math.sinh(-32*Math.LN2));
// Case |x| in [22, log(maxdouble)]
arktest.assertEQ(1.3440585709080678e43, Math.sinh(100));
arktest.assertEQ(-1.3440585709080678e43, Math.sinh(-100));
// No overflow, case |x| in [log(maxdouble), threshold]
arktest.assertEQ(1.7976931348621744e308, Math.sinh(710.4758600739439));
arktest.assertEQ(-1.7976931348621744e308, Math.sinh(-710.4758600739439));
// Overflow, case |x| > threshold
arktest.assertEQ(Infinity, Math.sinh(710.475860073944));
arktest.assertEQ(-Infinity, Math.sinh(-710.475860073944));
arktest.assertEQ(Infinity, Math.sinh(1000));
arktest.assertEQ(-Infinity, Math.sinh(-1000));

// Implementation-specific tests for cosh.
// Case |x| < 2^-55
arktest.assertEQ(1, Math.cosh(Math.pow(2, -56)));
arktest.assertEQ(1, Math.cosh(-Math.pow(2, -56)));
// Case |x| < 1/2*log(2). cosh(Math.LN2/4) = (sqrt(2)+1)/2^(5/4)
arktest.assertEQ(1.0150517651282178, Math.cosh(Math.LN2/4));
arktest.assertEQ(1.0150517651282178, Math.cosh(-Math.LN2/4));
// Case 1/2*log(2) < |x| < 22. cosh(10*Math.LN2) = 1048577/2048
arktest.assertEQ(512.00048828125, Math.cosh(10*Math.LN2));
arktest.assertEQ(512.00048828125, Math.cosh(-10*Math.LN2));
// Case 22 <= |x| < log(maxdouble)
arktest.assertEQ(2.1474836479999983e9, Math.cosh(32*Math.LN2));
arktest.assertEQ(2.1474836479999983e9, Math.cosh(-32*Math.LN2));
// Case log(maxdouble) <= |x| <= overflowthreshold
arktest.assertEQ(1.7976931348621744e308, Math.cosh(710.4758600739439));
arktest.assertEQ(1.7976931348621744e308, Math.cosh(-710.4758600739439));
// Overflow.
arktest.assertEQ(Infinity, Math.cosh(710.475860073944));
arktest.assertEQ(Infinity, Math.cosh(-710.475860073944));

// Implementation-specific tests for tanh.
// Case |x| < 2^-55
const two56 = Math.pow(2, -56);
arktest.assertEQ(two56, Math.tanh(two56));
arktest.assertEQ(-two56, Math.tanh(-two56));
// Case |x| < 1
arktest.assertEQ(0.6, Math.tanh(Math.LN2));
arktest.assertEQ(-0.6, Math.tanh(-Math.LN2));
// Case  1 < |x| < 22
arktest.assertEQ(15/17, Math.tanh(2 * Math.LN2));
arktest.assertEQ(-15/17, Math.tanh(-2 * Math.LN2));
// Case |x| > 22
arktest.assertEQ(1, Math.tanh(100));
arktest.assertEQ(-1, Math.tanh(-100));
// Test against overflow
arktest.assertEQ(1, Math.tanh(1e300));
arktest.assertEQ(-1, Math.tanh(-1e300));
