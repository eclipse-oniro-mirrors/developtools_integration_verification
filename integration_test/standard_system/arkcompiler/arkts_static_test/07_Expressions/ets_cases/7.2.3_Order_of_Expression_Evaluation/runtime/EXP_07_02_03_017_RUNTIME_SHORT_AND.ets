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
 * @id EXP_07_02_03_017_RUNTIME_SHORT_AND
 * @expect runtime
 * @section 7.2.3
 * @design 验证 && 短路求值：左为 false 时跳过右操作数
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

function track(s: string): boolean {
  trace += s;
  return s == 'true';
}

function main(): void {
  trace = '';
  let a: boolean = track('true') && track('R');
  if (trace != 'trueR') {
    throw new Error('and true path fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let b: boolean = track('false') && track('skip');
  if (trace != 'false') {
    throw new Error('and false short-circuit fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let c: boolean = track('false') && track('x') && track('y');
  if (trace != 'false') {
    throw new Error('and chained short-circuit fail: ' + trace);
  }
  }
  }
  }
  }
console.log('verified');
}
