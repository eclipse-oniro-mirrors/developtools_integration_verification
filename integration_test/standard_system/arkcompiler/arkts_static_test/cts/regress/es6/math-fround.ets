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


// Monkey-patch Float32Array.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

Float32Array = function(x) { this[0] = 0; };

arktest.assertTrue(isNaN(Math.fround(NaN)));
arktest.assertTrue(isNaN(Math.fround(function() {})));
arktest.assertTrue(isNaN(Math.fround({ toString: function() { return NaN; } })));
arktest.assertTrue(isNaN(Math.fround({ valueOf: function() { return 'abc'; } })));
arktest.assertTrue(isNaN(Math.fround(NaN)));
arktest.assertTrue(isNaN(Math.fround(function() {})));
arktest.assertTrue(isNaN(Math.fround({ toString: function() { return NaN; } })));
arktest.assertTrue(isNaN(Math.fround({ valueOf: function() { return 'abc'; } })));

function unopt(x) { return Math.fround(x); }
function opt(y) { return Math.fround(y); }

ArkTools.prepareFunctionForOptimization(opt);
opt(0.1);
opt(0.1);
unopt(0.1);
ArkTools.neverOptimizeFunction(unopt);
ArkTools.optimizeFunctionOnNextCall(opt);

function test(f) {
  arktest.assertEQ('Infinity', String(1/f(0)));
  arktest.assertEQ('-Infinity', String(1/f(-0)));
  arktest.assertEQ('Infinity', String(f(Infinity)));
  arktest.assertEQ('-Infinity', String(f(-Infinity)));
  arktest.assertEQ('Infinity', String(f(1E200)));
  arktest.assertEQ('-Infinity', String(f(-1E200)));
  arktest.assertEQ('Infinity', String(1/f(1E-300)));
  arktest.assertEQ('-Infinity', String(1/f(-1E-300)));
}

test(opt);
test(unopt);

const mantissa23Shift = Math.pow(2, -23);
const mantissa29Shift = Math.pow(2, -23-29);

// Javascript implementation of IEEE 754 to test double to single conversion.
function IEEE754Float(signBit,
                      exponentBits,
                      mantissa23Bits,
                      mantissa29Bits) {
  this.signBit = signBit & 1;
  this.exponentBits = exponentBits & ((1 << 11) - 1);
  this.mantissa23Bits = mantissa23Bits & ((1 << 23) - 1);
  this.mantissa29Bits = mantissa29Bits & ((1 << 29) - 1);
}

IEEE754Float.prototype.returnSpecial = function() {
  if (mantissa23Bits == 0 && mantissa29Bits == 0) { return sign * Infinity; }
  return NaN;
}

IEEE754Float.prototype.toDouble = function() {
  let sign = this.signBit ? -1 : 1;
  let exponent = this.exponentBits - 1023;
  if (exponent == -1023) { returnSpecial(); }
  let mantissa = 1 + this.mantissa23Bits * mantissa23Shift +
                     this.mantissa29Bits * mantissa29Shift;
  return sign * Math.pow(2, exponent) * mantissa;
}

IEEE754Float.prototype.toSingle = function() {
  let sign = this.signBit ? -1 : 1;
  let exponent = this.exponentBits - 1023;
  if (exponent == -1023) { returnSpecial(); }
  if (exponent > 127) {
    return sign * Infinity;
  }
  if (exponent < -126) { return this.toSingleSubnormal(sign, exponent); }
  let round = this.mantissa29Bits >> 28;
  let mantissa = 1 + (this.mantissa23Bits + round) * mantissa23Shift;
  return sign * Math.pow(2, exponent) * mantissa;
}

IEEE754Float.prototype.toSingleSubnormal = function(sign, exponent) {
  let shift = -126 - exponent;
  if (shift > 24) {
    return sign * 0;
  }
  let roundMask = 1 << (shift - 1);
  let mantissa23Bits = this.mantissa23Bits + (1 << 23);
  let round = ((mantissa23Bits & roundMask) != 0) | 0;
  if (round) {  // Round to even if tied.
    const tiedMask = roundMask - 1;
    const resultLastBitMask = 1 << shift;
    const tied = this.mantissa29Bits == 0 &&
               (mantissa23Bits & tiedMask ) == 0;
    const resultAlreadyEven = (mantissa23Bits & resultLastBitMask) == 0;
    if (tied && resultAlreadyEven) { round = 0; }
  }
  mantissa23Bits >>= shift;
  let mantissa = (mantissa23Bits + round) * mantissa23Shift;
  return sign * Math.pow(2, -126) * mantissa;
}


const pi = new IEEE754Float(0, 0x400, 0x490fda, 0x14442d18);
arktest.assertEQ(pi.toSingle(), opt(pi.toDouble()));
arktest.assertEQ(pi.toSingle(), unopt(pi.toDouble()));


function fuzzMantissa(sign, exp, m1inc, m2inc) {
  for (let m1 = 0; m1 < (1 << 23); m1 += m1inc) {
    for (let m2 = 0; m2 < (1 << 29); m2 += m2inc) {
      const float = new IEEE754Float(sign, exp, m1, m2);
      arktest.assertEQ(float.toSingle(), unopt(float.toDouble()));
      arktest.assertEQ(float.toSingle(), opt(float.toDouble()));
    }
  }
}

for (let sign = 0; sign < 2; sign++) {
  for (let exp = 1024 - 170; exp < 1024 + 170; exp++) {
    fuzzMantissa(sign, exp, 1337 * exp - sign, 127913 * exp - sign);
  }
}
