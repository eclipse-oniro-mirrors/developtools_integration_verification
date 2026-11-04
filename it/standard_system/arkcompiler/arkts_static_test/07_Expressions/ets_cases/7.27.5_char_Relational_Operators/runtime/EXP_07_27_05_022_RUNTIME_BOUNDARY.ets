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
 * @id EXP_07_27_05_022_RUNTIME_BOUNDARY
 * @expect runtime
 * @section 7.27.5
 * @design 验证 char 边界值比较：最小值 NUL、最大值 ￿
 *  * @note 运行时用例：验证该场景的运行时行为
 *       NUL = 0（最小值），￿ = 65535（最大值）
 */
function main(): void {
    let min: char = c'\x00';
    let max: char = c'￿';
    let mid: char = c'翿';

    // 最小值比较
    if (min < mid != true) {
    throw new Error('FAIL: 0 < 32767 should be true');
  }
  }
  }
  } }
    if (min <= min != true) {
    throw new Error('FAIL: 0 <= 0 should be true');
  }
  }
  }
  } }
    if (min > mid != false) {
    throw new Error('FAIL: 0 > 32767 should be false');
  }
  }
  }
  } }
    if (min >= min != true) {
    throw new Error('FAIL: 0 >= 0 should be true');
  }
  }
  }
  } }

    // 最大值比较
    if (max > mid != true) {
    throw new Error('FAIL: 65535 > 32767 should be true');
  }
  }
  }
  } }
    if (max >= max != true) {
    throw new Error('FAIL: 65535 >= 65535 should be true');
  }
  }
  }
  } }
    if (max < mid != false) {
    throw new Error('FAIL: 65535 < 32767 should be false');
  }
  }
  }
  } }
    if (max <= max != true) {
    throw new Error('FAIL: 65535 <= 65535 should be true');
  }
  }
  }
  } }
console.log('verified');
}
