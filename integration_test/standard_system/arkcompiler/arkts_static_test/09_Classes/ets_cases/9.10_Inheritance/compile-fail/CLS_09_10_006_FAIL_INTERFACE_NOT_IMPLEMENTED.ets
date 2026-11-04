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
 * @id CLS_09_10_006_FAIL_INTERFACE_NOT_IMPLEMENTED
 * @expect compile-fail
 * @section 9.10
 * @design 非抽象类实现接口时必须实现所有继承的抽象方法，否则编译失败
 * @note 反向用例：类实现接口但未提供接口中抽象方法的实现
 */
interface Drawable {
  draw(): void
  getColor(): string
}

class Rectangle implements Drawable {
  public width: int = 0
  public height: int = 0
  // 缺少 draw() 实现
  // 缺少 getColor() 实现
}
