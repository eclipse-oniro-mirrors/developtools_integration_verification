/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
@Entry
@Component
struct FocusTextUI0950 {
  @State decorationColor: ResourceStr = $r('app.color.ColorBlack'); // 初始装饰线颜色

  build() {
    Column() {
      Text('这是一段带有装饰线的测试文本')
        .fontSize(20)
        .decoration({
          type: TextDecorationType.Underline,
          color: this.decorationColor,
          style: TextDecorationStyle.SOLID
        })
        .id('changeColorBtn0950')
        .onClick(() => {
          this.decorationColor = $r('app.color.ColorRed'); // 设置为红色资源
        })
    }
    .width('100%')
    .padding(20)
  }
}