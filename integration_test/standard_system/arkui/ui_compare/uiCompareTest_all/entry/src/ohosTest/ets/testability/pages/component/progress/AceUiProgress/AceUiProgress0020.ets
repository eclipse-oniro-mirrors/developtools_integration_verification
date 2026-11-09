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
struct AceUiProgress0020 {
  // 步骤1：构造ProgressMask，设置enableBreathingAnimation为false
  // 步骤2：将进度调至最大（100）
  private progressMask: ProgressMask = new ProgressMask(100, 100, Color.Blue)

  aboutToAppear(): void {
    // 设置enableBreathingAnimation为false，关闭光晕闪烁动画
    this.progressMask.enableBreathingAnimation(false)
  }

  build() {
    Column() {
      // 步骤1：构造一个Image组件，添加mask属性并设置ProgressMask，enableBreathingAnimation为false
      Image($r('app.media.icon'))
        .width(200)
        .height(200)
        .mask(this.progressMask)
        .id('image_progress_0020')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
