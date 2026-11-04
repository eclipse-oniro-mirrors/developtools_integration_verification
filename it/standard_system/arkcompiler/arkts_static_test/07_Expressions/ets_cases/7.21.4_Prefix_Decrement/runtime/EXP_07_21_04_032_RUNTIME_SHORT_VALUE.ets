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
 * @id EXP_07_21_04_032_RUNTIME_SHORT_VALUE
 * @expect runtime
 * @section 7.21.4
 * @design 验证 short 前置递减返回值语义和副作用。
 *         --x 返回自减后的新值，x 变为 old - 1。
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let x: short = 1;
    let result: short = --x;
    if (result != 0) {
    throw new Error('assertion failed: expected return value 0, got ' + result);
  }
  }
  }
  }
    }
    if (x != 0) {
    throw new Error('assertion failed: expected x=0, got ' + x);
  }
  }
  }
  }
    }
console.log('verified');
}
