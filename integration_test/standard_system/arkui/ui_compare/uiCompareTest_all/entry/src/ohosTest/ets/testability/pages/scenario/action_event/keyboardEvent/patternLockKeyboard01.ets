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
struct PatternLockKeyboard01 {
  private patternLockController: PatternLockController = new PatternLockController();

  build() {
    Column({ space: 20 }) {
      Text('PatternLock键盘Tab和方向键测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // PatternLock组件
      PatternLock(this.patternLockController)
        .id('patternLock_01')
        .sideLength(200)
        .circleRadius(9)
        .pathStrokeWidth(5)
        .activeColor('#707070')
        .selectedColor('#707070')
        .pathColor('#707070')
        .backgroundColor('#F5F5F5')
        .autoReset(true)
        .focusable(true)
        .onPatternComplete((input: number[]) => {
          console.info('Pattern complete: ' + input.toString());
        })
        .onDotConnect((index: number) => {
          console.info('Dot connect index: ' + index);
        })

      Text('预期效果：按Tab键和上下左右键，九宫格解锁按钮可正常获焦')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F3F4F6')
  }
}
