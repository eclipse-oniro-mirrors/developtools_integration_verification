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
struct LoadingProgress0010 {

  build() {
    Column() {
      Text('Loading刷新图标动效测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 30 })

      Text('观察加载动画效果，动画应为非匀速')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 构造loadingProgress组件，观察加载动画效果
      LoadingProgress()
        .width(100)
        .height(100)
        .color(Color.Blue)
        .id('loading_progress_0010')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}
