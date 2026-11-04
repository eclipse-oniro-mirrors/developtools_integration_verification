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
 * @id EXP_07_20_038_RUNTIME_LAZY_EVALUATION
 * @expect runtime
 * @section 7.20
 * @design 验证 ?? 的短路求值（lazy evaluation）。
 *         LHS 非 nullish 时 RHS 不被求值。
 *         通过副作用计数器验证：当 LHS 为非 nullish 时，RHS 的函数调用不会发生。
 * @note 运行时用例：验证 ?? 短路求值
 */
let sideEffectCount: int = 0;

function getDefault(): string {
    sideEffectCount = sideEffectCount + 1;
    return 'default';
}

function main(): void {
    // LHS 非 nullish，RHS 不应执行
    let result: string = 'direct' ?? getDefault();
    if (result != 'direct') {
    throw new Error('assertion failed: expected 'direct', got ' + result);
  }
  }
  }
  }
    }
    if (sideEffectCount != 0) {
    throw new Error("assertion failed: side effect occurred, count=" + sideEffectCount);
  }
  }
  }
  }
    }
console.log('verified');
}
