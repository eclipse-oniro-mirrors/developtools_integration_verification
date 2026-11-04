/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id EXP_07_27_01_017_RUNTIME_IEEE754_SPECIAL
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉 IEEE 754 娴偣鐗规畩鍊煎湪鍏崇郴姣旇緝涓殑琛屼负锛歂aN 鎭掍负 false銆佽礋鏃犵┓ < 鏈夐檺鍊笺€佹鏃犵┓ > 鏈夐檺鍊笺€佹闆剁瓑浜庤礋闆?
 *  * @note 杩愯鏃剁敤渚嬶細楠岃瘉璇ュ満鏅殑杩愯鏃惰涓? */
function assert(cond: boolean, msg: string): void {
  if (!cond) {
    throw new Error('FAIL: ' + msg);
  }
  }
  }
  }
  }
}

function main(): void {
  // 鐢熸垚 NaN: 0.0 / 0.0 浜х敓 NaN锛圛EEE 754 瑙勫畾锛?
  let nan: double = 0.0 / 0.0;
  // 鐢熸垚鏃犵┓澶? 1.0 / 0.0 = +Inf, -1.0 / 0.0 = -Inf
  let posInf: double = 1.0 / 0.0;
  let negInf: double = -1.0 / 0.0;
  let zero: double = 0.0;
  let negZero: double = -0.0;

  // ===== NaN 姣旇緝瑙勫垯锛氭墍鏈夋瘮杈冪粨鏋滃潎涓?false =====
  assert((nan < 2.0) == false, 'NaN < 2.0 should be false');
  assert((nan > 2.0) == false, 'NaN > 2.0 should be false');
  assert((nan <= 2.0) == false, 'NaN <= 2.0 should be false');
  assert((nan >= 2.0) == false, 'NaN >= 2.0 should be false');
  assert((nan < nan) == false, 'NaN < NaN should be false');
  assert((nan > nan) == false, 'NaN > NaN should be false');
  assert((nan <= nan) == false, 'NaN <= NaN should be false');
  assert((nan >= nan) == false, 'NaN >= NaN should be false');
  assert((nan < 0.0) == false, 'NaN < 0.0 should be false');
  assert((nan > 0.0) == false, 'NaN > 0.0 should be false');

  // ===== 璐熸棤绌?< 鎵€鏈夋湁闄愬€?=====
  assert((negInf < 0.0) == true, "-Inf < 0.0 should be true");
  assert((negInf < -1e300) == true, "-Inf < -1e300 should be true");
  assert((negInf < 1e300) == true, "-Inf < 1e300 should be true");
  assert((negInf > 0.0) == false, "-Inf > 0.0 should be false");
  assert((negInf >= 0.0) == false, "-Inf >= 0.0 should be false");
  assert((negInf < -1e308) == true, "-Inf < -1e308 should be true");
  assert((negInf <= negInf) == true, "-Inf <= -Inf should be true");

  // ===== 姝ｆ棤绌?> 鎵€鏈夋湁闄愬€?=====
  assert((posInf > 0.0) == true, "+Inf > 0.0 should be true");
  assert((posInf > 1e300) == true, "+Inf > 1e300 should be true");
  assert((posInf < 0.0) == false, "+Inf < 0.0 should be false");
  assert((posInf <= 0.0) == false, "+Inf <= 0.0 should be false");
  assert((posInf < 1e308) == false, "+Inf < 1e308 should be false");
  assert((posInf >= posInf) == true, "+Inf >= +Inf should be true");

  // ===== 姝ｉ浂绛変簬璐熼浂 =====
  assert((negZero <= zero) == true, "-0.0 <= 0.0 should be true (zero equals zero)");
  assert((negZero >= zero) == true, "-0.0 >= 0.0 should be true (zero equals zero)");
  assert((zero <= negZero) == true, '0.0 <= -0.0 should be true (zero equals zero)');
  assert((zero >= negZero) == true, '0.0 >= -0.0 should be true (zero equals zero)');
  assert((negZero < zero) == false, "-0.0 < 0.0 should be false");
  assert((negZero > zero) == false, "-0.0 > 0.0 should be false");

  // ===== 璐熸棤绌?vs 姝ｆ棤绌?=====
  assert((negInf < posInf) == true, "-Inf < +Inf should be true");
  assert((posInf > negInf) == true, "+Inf > -Inf should be true");
  assert((negInf <= posInf) == true, "-Inf <= +Inf should be true");
  assert((posInf >= negInf) == true, "+Inf >= -Inf should be true");

  // ===== NaN 涓庢棤绌锋瘮杈?=====
  assert((nan < posInf) == false, 'NaN < +Inf should be false');
  assert((nan > negInf) == false, 'NaN > -Inf should be false');

  // ===== float 鐗堟湰 NaN/Inf 楠岃瘉 =====
  let nanF: float = 0.0f / 0.0f;
  let infF: float = 1.0f / 0.0f;
  assert((nanF < 1.0f) == false, 'float NaN < 1.0f should be false');
  assert((infF > 1e20f) == true, 'float +Inf > 1e20f should be true');

  console.log('verified');
}
