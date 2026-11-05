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
 * @id EXP2_17_11_01_008_FAIL_DEEP_EXTENDS_FINAL
 * @expect compile-fail
 * @section 17.11.1
 * @design 深层继承链中包含 final 类：验证 extends 关系中任何一环是 final 类都应产生编译时错误
 * @note 反向用例：验证深层继承链（C extends B extends final A）中 A 是 final 类时产生 ESE0178 编译错误
 */
final class DeepFinal { public base: int = 0
}

class Middle extends DeepFinal {
  public mid: int = 1
}

class Bottom extends Middle {
  public bot: int = 2}
