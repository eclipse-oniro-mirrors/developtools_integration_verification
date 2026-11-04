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
 * @id EXP_07_21_04_031_RUNTIME_INT_VALUE
 * @expect runtime
 * @section 7.21.4
 * @design 验证 int 前置递减返回值语义和副作用。
 *         --x 返回自减后的新值，x 变为 old - 1。
 *         与后置 x-- 关键区别：返回新值（非旧值）。
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let x: int = 5;
    let result: int = --x;
    if (result != 4) {
    throw new Error('assertion failed: expected return value 4, got ' + result);
  }
  }
  }
  }
    }
    if (x != 4) {
    throw new Error('assertion failed: expected x=4, got ' + x);
  }
  }
  }
  }
    }
console.log('verified');
}
