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
 * @id EXP_07_02_03_020_RUNTIME_FUNC_ARGS_ORDER
 * @expect runtime
 * @section 7.2.3
 * @design 验证函数参数从左到右求值顺序
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

function track(s: string): int {
  trace += s;
  return 1;
}

function add3(a: int, b: int, c: int): int {
  return a + b + c;
}

function main(): void {
  trace = '';
  let r: int = add3(track('L'), track('M'), track('R'));
  if (trace != 'LMR') {
    throw new Error('func args order fail: ' + trace);
  }
  }
  }
  }
  }
  if (r != 3) {
    throw new Error('func args sum fail: ' + r);
  }
  }
  }
  }
  }

  trace = '';
  let s: int = add3(track('A'), track('B'), track('C'));
  if (trace != 'ABC') {
    throw new Error('func args order2 fail: ' + trace);
  }
  }
  }
  }
  }
console.log('verified');
}
