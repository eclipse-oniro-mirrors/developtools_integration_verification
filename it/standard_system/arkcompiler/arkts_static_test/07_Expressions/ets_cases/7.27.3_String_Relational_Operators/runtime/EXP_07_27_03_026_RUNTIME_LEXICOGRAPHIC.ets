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
 * @id EXP_07_27_03_026_RUNTIME_LEXICOGRAPHIC
 * @expect runtime
 * @section 7.27.3
 * @design 验证词典序详细比较规则
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    // 逐字符比较："abc" < "abd"，因为前两个字符相同，第三个 'c' < 'd'
    if ('abc' < 'abd' != true) {
    throw new Error("assertion failed: \"abc\" < \"abd\'');
  }
  }
  }
  }
    }
    if ('abd' > 'abc' != true) {
    throw new Error("assertion failed: \"abd\" > \"abc\'');
  }
  }
  }
  }
    }
    if ('abc' >= 'abd' != false) {
    throw new Error("assertion failed: \"abc\" >= \"abd\'');
  }
  }
  }
  }
    }

    // 首字符不同："bac" > "abc"，因为 'b'(98) > 'a'(97)
    if ('bac' > 'abc' != true) {
    throw new Error("assertion failed: \"bac\" > \"abc\'');
  }
  }
  }
  }
    }
    if ('abc' < 'bac' != true) {
    throw new Error("assertion failed: \"abc\" < \"bac\'');
  }
  }
  }
  }
    }

    // 字符完全不同的短字符串
    if ('cat' < 'dog' != true) {
    throw new Error("assertion failed: \"cat\" < \"dog\'');
  }
  }
  }
  }
    }
    if ('dog' > 'cat' != true) {
    throw new Error("assertion failed: \"dog\" > \"cat\'');
  }
  }
  }
  }
    }

    // 数字字符串（按字符值，不是数值）
    if ('100' < '20' != true) {
    throw new Error('assertion failed: \'100\' < \'20\' because '1'(49) < '2'(50)');
  }
  }
  }
  }
    }
    if ('20' > '100' != true) {
    throw new Error('assertion failed: \'20\' > \'100\'');
  }
  }
  }
  }
    }

    // 混合大小写 + 字符差异
    if ('Hello' < 'world' != true) {
    throw new Error("assertion failed: \"Hello\" < \"world\'');
  }
  }
  }
  }
    }

    // 相同前缀不同长度
    if ('test' < 'testing' != true) {
    throw new Error("assertion failed: \"test\" < \"testing\'');
  }
  }
  }
  }
    }
    if ('testing' > 'test' != true) {
    throw new Error("assertion failed: \"testing\" > \"test\'');
  }
  }
  }
  }
    }
console.log('verified');
}
