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
 * @id EXP_07_27_02_007_RUNTIME_BIGINT_LARGE
 * @expect runtime
 * @section 7.27.2
 * @design 验证大整数bigint之间的关系比较运行时行为（超出int/long范围的bigint值）
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
  // Very large bigint values (beyond int/long range)
  let huge1: bigint = 123456789012345678901234567890n
  let huge2: bigint = 987654321098765432109876543210n
  let huge3: bigint = 123456789012345678901234567890n  // same as huge1

  // huge1 < huge2
  if (!(huge1 < huge2)) {
    throw new Error('fail');
  }// huge2 > huge1
  if (!(huge2 > huge1)) {
    throw new Error('fail');
  }// huge1 > huge2
  if (huge1 > huge2) {
    throw new Error('fail');
  }
  }
  }
  }
  }// huge2 < huge1
  if (huge2 < huge1) {
    throw new Error('fail');
  }
  }
  }
  }
  }// Equal large bigints
  if (!(huge1 <= huge3)) {
    throw new Error('fail');
  }if (!(huge1 >= huge3)) {
    throw new Error('fail');
  }if (huge1 < huge3) {
    throw new Error('fail');
  }
  }
  }
  }
  }if (huge1 > huge3) {
    throw new Error('fail');
  }
  }
  }
  }
  }// Negative large bigint
  let negHuge: bigint = -99999999999999999999999999999n
  if (!(negHuge < huge1)) {
    throw new Error('fail');
  }if (!(negHuge < 0n)) {
    throw new Error('fail');
  }if (negHuge > huge1) {
    throw new Error('fail');
  }
  }
  }
  }
  }console.log('verified')
}
