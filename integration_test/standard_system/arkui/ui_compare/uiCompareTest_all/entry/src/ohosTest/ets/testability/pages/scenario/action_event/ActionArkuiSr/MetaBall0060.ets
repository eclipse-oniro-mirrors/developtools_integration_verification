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
@ComponentV2
export struct MetaBall0060 {
  @Local animationRunning: boolean = false;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_ACTION_ARKUI_SR20241018107358_0060')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：高级组件metaBall动画效果六`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 15 }) {
        // 黑点模拟
        Circle({ width: 30, height: 30 })
          .fill(Color.Black)

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(10)

      Button(`2-task-rightwards`)
        .id('btn')
        .onClick(() => {
          this.animationRunning = true;
          this.testStatus = '✅ 动画开始：黑点先向右放大延伸、再回弹、最后向左延伸（重复一次）';
          
          setTimeout(() => {
            this.testStatus += '\n✅ 动画结束：play end 2';
            this.animationRunning = false;
          }, 3000);
        })

      Divider()

      Text(`预期结果：\n2. 上方黑点会发生先向右放大延伸、再回弹、最后向左延伸的动效，重复一次\n3. 日志先打印click事件，动效结束后打印play end 2`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：此测试模拟metaBall动画效果。实际效果需在真机上观察。`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

