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
 * @id EXP_07_02_03_022_RUNTIME_CHAINED_LOGICAL
 * @expect runtime
 * @section 7.2.3
 * @design 验证链式逻辑短路：连续的 && 或 || 短路行为
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

function trackTrue(s: string): boolean {
  trace += s;
  return true;
}

function trackFalse(s: string): boolean {
  trace += s;
  return false;
}

function main(): void {
  trace = '';
  let a: boolean = trackTrue('A') && trackTrue('B') && trackTrue('C');
  if (trace != 'ABC') {
    throw new Error('chained and all true fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let b: boolean = trackTrue('T') && trackFalse('F') && trackTrue('skip');
  if (trace != 'TF') {
    throw new Error('chained and short fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let c: boolean = trackFalse('1') || trackFalse('2') || trackTrue('3');
  if (trace != '123') {
    throw new Error('chained or all consumed fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let d: boolean = trackTrue('X') || trackTrue("skip1") || trackFalse("skip2");
  if (trace != 'X') {
    throw new Error('chained or short fail: ' + trace);
  }
  }
  }
  }
  }
console.log('verified');
}
