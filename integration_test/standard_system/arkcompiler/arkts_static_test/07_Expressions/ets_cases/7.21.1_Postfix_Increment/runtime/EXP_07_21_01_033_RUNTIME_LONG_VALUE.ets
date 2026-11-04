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
 * @id EXP_07_21_01_033_RUNTIME_LONG_VALUE
 * @expect runtime
 * @section 7.21.1
 * @design 验证 long 后置递增返回值语义和副作用。
 *         x++ 返回自增前的值（old value），x 变为 old + 1。
 * @note 运行时用例：long++ 返回旧值，变量+1
 */
function main(): void {
    let x: long = 10000000000;
    let result: long = x++;
    if (result != 10000000000) {
    throw new Error('assertion failed: expected return value 10000000000, got ' + result);
  }
  }
  }
  }
    }
    if (x != 10000000001) {
    throw new Error('assertion failed: expected x=10000000001, got ' + x);
  }
  }
  }
  }
    }
console.log('verified');
}
