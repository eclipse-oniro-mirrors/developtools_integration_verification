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
 * @id CLS_09_10_019_FAIL_FIELD_OVERRIDE_ACCESS_MODIFIER_MISMATCH
 * @expect compile-fail
 * @section 9.10
 * @design 重写字段的访问修饰符必须与基类被重写字段的访问修饰符相同，否则编译失败
 * @note 反向用例：基类public字段被派生类以protected声明重写，访问修饰符不匹配
 */
class Box {
  public width: int = 10
  protected height: int = 20
  public label: string = "box"
}

class SafeBox extends Box {
  protected width: int = 30   // Compile-time error: 'protected' != 'public'
  public height: int = 50     // Compile-time error: 'public' != 'protected'
  private label: string = "safe" // Compile-time error: 'private' != 'public'
}
