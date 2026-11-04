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
 * @id EXP_07_02_03_015_RUNTIME_BINARY_ORDER
 * @expect runtime
 * @section 7.2.3
 * @design 验证二元加法左到右求值顺序：全局 trace 字符串验证求值顺序为 LR
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

function track(s: string): int {
  trace += s;
  return 1;
}

function main(): void {
  trace = '';
  let x: int = track('L') + track('R');
  if (trace != 'LR') {
    throw new Error('binary order fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let y: int = track('A') - track('B');
  if (trace != 'AB') {
    throw new Error('binary sub order fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let z: int = track('X') * track('Y');
  if (trace != 'XY') {
    throw new Error('binary mul order fail: ' + trace);
  }
  }
  }
  }
  }
console.log('verified');
}
