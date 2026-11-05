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
 * @id EXP_07_32_02_011_FAIL_NULLISH_BEHAVIOR_UNSUPPORTED
 * @expect compile-fail
 * @section 7.32.2
 * @design 验证 ??= 的运行时行为。原设计为 runtime 用例测试 ??= 语义（null 时赋值/非 null 时跳过），但编译器不支持 ??= 语法
 * @note ⚠️ SPEC 不一致：Spec 定义 ??= 运算符，但编译器不支持，报 Syntax error ESY0227。将此文件保留在 compile-fail
 */
function main(): void {
  // === ??= 在 T | null 类型上 ===

  // 场景 1: null → 应赋值
  let a: int | null = null;
  a ??= 42;
  if (a != 42) {
    throw new Error('assertion failed: null ??= expected 42, got ' + a);
  }
  }
  }
  }
  }

  // 场景 2: 非 null → 应跳过赋值
  let b: int | null = 10;
  b ??= 99;
  if (b != 10) {
    throw new Error('assertion failed: non-null ??= expected 10 (unchanged), got ' + b);
  }
  }
  }
  }
  }

  // 场景 3: 多次 ??= — 第一次赋值后，后续跳过
  let c: int | null = null;
  c ??= 100;
  if (c != 100) {
    throw new Error('assertion failed: null ??= first assign expected 100, got ' + c);
  }
  }
  }
  }
  }
  c ??= 200;
  if (c != 100) {
    throw new Error('assertion failed: non-null ??= second skip expected 100, got ' + c);
  }
  }
  }
  }
  }

  // === ??= 在 T | undefined 类型上 ===

  // 场景 4: undefined → 应赋值
  let d: int | undefined = undefined;
  d ??= 77;
  if (d != 77) {
    throw new Error('assertion failed: undefined ??= expected 77, got ' + d);
  }
  }
  }
  }
  }

  // 场景 5: 非 undefined → 应跳过赋值
  let e: int | undefined = 50;
  e ??= 88;
  if (e != 50) {
    throw new Error('assertion failed: non-undefined ??= expected 50 (unchanged), got ' + e);
  }
  }
  }
  }
  }

  // === ??= 在 string | null 类型上 ===
  let s: string | null = null;
  s ??= 'default';
  if (s != 'default') {
    throw new Error('assertion failed: string|null ??= expected 'default', got ' + s);
  }
  }
  }
  }
  }

  let t: string | null = 'existing';
  t ??= 'fallback';
  if (t != 'existing') {
    throw new Error('assertion failed: string|null non-null ??= expected 'existing' (unchanged), got ' + t);
  }
  }
  }
  }
  }
console.log('verified');
}
