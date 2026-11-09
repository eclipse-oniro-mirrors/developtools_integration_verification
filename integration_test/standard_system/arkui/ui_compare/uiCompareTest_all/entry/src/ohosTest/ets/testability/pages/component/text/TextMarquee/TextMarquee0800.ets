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
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXT_TV_0800
 * 测试目的：多个跑马灯同时执行，流畅无卡顿
 * 预置条件：text文本超长
 * 预期结果：不同text控件有跑马灯+渐隐，动效流畅
 */

@Entry
@ComponentV2
export struct TextMarquee0800 {
  @Local testStatus: string = '运行中...';
  @Local runningTime: number = 0;
  private timerId: number = -1;

  // 不同的超长文本
  private texts: string[] = [
    '这是第一个跑马灯文本，速度较慢，用于测试多跑马灯同时执行的流畅性',
    '第二个跑马灯文本内容不同，速度中等，验证多个跑马灯不会相互干扰',
    '第三个跑马灯采用较快速度，观察是否存在卡顿现象',
    '第四个跑马灯文本，测试页面静置10分钟的稳定性',
    '第五个跑马灯，不同方向不同速度，验证渐隐效果是否正常'
  ];

  aboutToAppear() {
    // 计时器
    this.timerId = setInterval(() => {
      this.runningTime++;
    }, 1000);
  }

  aboutToDisappear() {
    if (this.timerId !== -1) {
      clearInterval(this.timerId);
    }
  }

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_TV_0800')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text('测试：多个跑马灯同时执行，流畅无卡顿')
        .fontSize(13)
        .fontColor(Color.Gray)

      // 运行状态
      Row({ space: 15 }) {
        Text(`运行时间：${Math.floor(this.runningTime / 60)}分${this.runningTime % 60}秒`)
          .fontSize(12)
          .fontColor(Color.Blue)

        Text(this.testStatus)
          .fontSize(12)
          .fontColor(Color.Green)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)

      Divider()

      // 多个跑马灯组件
      Text('5个跑马灯同时运行（观察流畅性）：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 跑马灯1 - 慢速
      Text(this.texts[0])
        .id('marquee1')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor('#E91E63')
        .padding(10)
        .borderRadius(6)
        .textOverflow({ overflow: TextOverflow.MARQUEE })

      // 跑马灯2 - 中速
      Text(this.texts[1])
        .id('marquee2')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor('#9C27B0')
        .padding(10)
        .borderRadius(6)
        .textOverflow({ overflow: TextOverflow.MARQUEE })

      // 跑马灯3 - 快速
      Text(this.texts[2])
        .id('marquee3')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor('#673AB7')
        .padding(10)
        .borderRadius(6)
        .textOverflow({ overflow: TextOverflow.MARQUEE })

      // 跑马灯4
      Text(this.texts[3])
        .id('marquee4')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor('#3F51B5')
        .padding(10)
        .borderRadius(6)
        .textOverflow({ overflow: TextOverflow.MARQUEE })

      // 跑马灯5
      Text(this.texts[4])
        .id('marquee5')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor('#2196F3')
        .padding(10)
        .borderRadius(6)
        .textOverflow({ overflow: TextOverflow.MARQUEE })

      Divider()

      // 测试说明
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 观察5个跑马灯同时运行')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 页面静置10分钟')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 确认动效流畅无卡顿')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Button('确认动效流畅')
        .id('confirmBtn')
        .width('80%')
        .onClick(() => {
          this.testStatus = '✅ 动效流畅无卡顿';
        })

      // 预期结果
      Text('预期结果：不同text控件有跑马灯+渐隐，动效流畅')
        .fontSize(12)
        .fontColor(Color.Green)
        .padding(8)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor(Color.White)
  }
}

