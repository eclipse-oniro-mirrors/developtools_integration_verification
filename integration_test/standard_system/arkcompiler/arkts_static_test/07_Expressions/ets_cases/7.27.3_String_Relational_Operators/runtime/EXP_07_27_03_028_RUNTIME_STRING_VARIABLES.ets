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
 * @id EXP_07_27_03_028_RUNTIME_STRING_VARIABLES
 * @expect runtime
 * @section 7.27.3
 * @design 验证字符串变量和常量比较的运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    const greeting: string = 'Hello';
    const subject: string = 'World';
    let a: string = 'alpha';
    let b: string = 'beta';
    let c: string = 'alpha';

    // const 比较
    if (greeting < subject != true) {
    throw new Error("assertion failed: \"Hello\" < \"World\'');
  }
  }
  }
  }
    }
    if (greeting > greeting != false) {
    throw new Error('assertion failed: greeting > greeting');
  }
  }
  }
  }
    }

    // 变量比较："alpha" < "beta"
    if (a < b != true) {
    throw new Error("assertion failed: \"alpha\" < \"beta\'');
  }
  }
  }
  }
    }
    if (a > b != false) {
    throw new Error("assertion failed: \"alpha\" > \"beta\'');
  }
  }
  }
  }
    }
    if (a <= b != true) {
    throw new Error("assertion failed: \"alpha\" <= \"beta\'');
  }
  }
  }
  }
    }
    if (a >= b != false) {
    throw new Error("assertion failed: \"alpha\" >= \"beta\'');
  }
  }
  }
  }
    }

    // 相同内容的变量
    if (a < c != false) {
    throw new Error("assertion failed: a < c (both \"alpha\")");
  }
  }
  }
  }
    }
    if (a <= c != true) {
    throw new Error("assertion failed: a <= c (both \"alpha\")");
  }
  }
  }
  }
    }
    if (a > c != false) {
    throw new Error("assertion failed: a > c (both \"alpha\")");
  }
  }
  }
  }
    }
    if (a >= c != true) {
    throw new Error("assertion failed: a >= c (both \"alpha\")");
  }
  }
  }
  }
    }

    // 字面量与变量混合
    if (a < 'beta' != true) {
    throw new Error("assertion failed: a < \"beta\'');
  }
  }
  }
  }
    }
    if ('beta' > a != true) {
    throw new Error("assertion failed: \"beta\" > a");
  }
  }
  }
  }
    }
    if (a >= 'alpha' != true) {
    throw new Error("assertion failed: a >= \"alpha\'');
  }
  }
  }
  }
    }
console.log('verified');
}
