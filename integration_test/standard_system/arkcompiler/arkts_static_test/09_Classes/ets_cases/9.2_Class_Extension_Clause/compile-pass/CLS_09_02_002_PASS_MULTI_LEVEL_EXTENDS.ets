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
 * @id CLS_09_02_002_PASS_MULTI_LEVEL_EXTENDS
 * @expect compile-pass
 * @section 9.2
 * @design 多级继承链A->B->C编译通过
 * @note 正向用例：验证extends子句支持多级继承
 */
class LevelA {
  public a: int = 1
}
class LevelB extends LevelA {
  public b: int = 2
}
class LevelC extends LevelB {
  public c: int = 3
}
