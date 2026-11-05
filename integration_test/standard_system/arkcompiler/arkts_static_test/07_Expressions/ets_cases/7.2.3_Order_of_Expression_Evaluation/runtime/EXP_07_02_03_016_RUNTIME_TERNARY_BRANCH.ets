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
 * @id EXP_07_02_03_016_RUNTIME_TERNARY_BRANCH
 * @expect runtime
 * @section 7.2.3
 * @design 验证三元条件优先求值：条件先求值，仅一个分支被求值
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

function condTrue(s: string): boolean {
  trace += s;
  return true;
}

function condFalse(s: string): boolean {
  trace += s;
  return false;
}

function branch(s: string): int {
  trace += s;
  return 1;
}

function main(): void {
  trace = '';
  let a: int = condTrue('C') ? branch('T') : branch('F');
  if (trace != 'CT') {
    throw new Error('ternary true branch fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let b: int = condFalse('c') ? branch('t') : branch('f');
  if (trace != 'cf') {
    throw new Error('ternary false branch fail: ' + trace);
  }
  }
  }
  }
  }
console.log('verified');
}
