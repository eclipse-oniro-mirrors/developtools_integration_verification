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

/**
 * 【异常值】关键帧动画期望帧率参数max>expectedFrameRateRange>min,但存在负数情况下，动画效果测试
 * SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0110
 */
@Entry
@ComponentV2
export struct UiOhosKeyframeanimatetoExpectedframe0110 {
  @Local logs: string[] = [];

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 20) {
      this.logs = this.logs.slice(0, 20);
    }
  }

  aboutToAppear(): void {
    this.addLog('页面加载完成');
  }

  build() {
    Scroll() {
      Column() {
        Text('【异常值】关键帧动画期望帧率参数max>expectedFrameRateRange>min,但存在负数情况下，动画效果测试')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_OHOS_KEYFRAMEANIMATETO_EXPECTEDFRAME_0110')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 10 })

        Text('测试步骤：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`1.创建一个蓝色背景得Circle.\n2.使用keyframeAnimateTo为Circl设置一段动画效果：\n0-1000ms为放大50%，1000-3000ms为缩小80%，其中iteration为5,delay为0，onfinsh打印字符"custom animate done".\n3.设置expectedFrameRateRange:{max:90,expected:60,min:-30}触发并查看动画效果\n4.设置expectedFrameRateRange:{max:30,expected:-60,min:-90}触发并查看动画效果`)
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`3.设置不生效，使用设备当前设置中的最高刷新率\n4.设置不生效，使用设备当前设置中的最高刷新率`)
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })
          .fontColor('#FF6B35')

        Button('开始测试')
          .width('80%')
          .margin({ top: 15, bottom: 10 })
          .id('btn')
          .onClick(() => {
            this.addLog('✅ 测试按钮已点击');
          })

        Text('测试日志：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(9)
              .padding(5)
              .width('100%')
              .backgroundColor(log.includes('✅') ? '#e8f5e9' : '#f5f5f5')
              .margin({ bottom: 2 })
          })
        }
        .width('95%')
        .height('9.84%')
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .padding(5)
        .margin({ top: 5 })

        Text('说明: 本用例为UI对比测试，请按照测试步骤进行手动操作')
          .fontSize(9)
          .fontColor('#999')
          .margin({ top: 10 })
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}
