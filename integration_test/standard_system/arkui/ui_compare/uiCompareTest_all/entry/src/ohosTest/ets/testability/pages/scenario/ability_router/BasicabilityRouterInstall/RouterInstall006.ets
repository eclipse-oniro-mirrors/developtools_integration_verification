/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'RouterInstall006';

@Entry
@ComponentV2
export struct RouterInstall006 {
  @Local statusInfo: string = '等待测试';
  @Local errorCode: string = '';
  @Local pushCount: number = 0;

  async pushMultiplePages(): Promise<void> {
    try {
      // 尝试连续push超过32个页面
      for (let i = 0; i < 35; i++) {
        this.pushCount = i + 1;
        this.statusInfo = `正在push第${this.pushCount}个页面...`;
        
        await router.pushUrl({
          url: 'testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall006',
          params: { count: i }
        });
        
        await new Promise<void>(resolve => setTimeout(resolve, 50));
        
        hilog.info(0x0000, TAG, `Pushed page ${this.pushCount}`);
      }
      
      this.statusInfo = `❌ 意外：成功push了${this.pushCount}个页面（超过32）`;
    } catch (error) {
      const err = error as BusinessError;
      this.errorCode = `${err.code}`;
      
      if (err.code === 100003) {
        this.statusInfo = `✅ 正确：第${this.pushCount}个页面push失败，返回错误码100003`;
        hilog.info(0x0000, TAG, `Correct error code: 100003 at page ${this.pushCount}`);
      } else {
        this.statusInfo = `⚠️ 返回了其他错误码：${err.code}`;
      }
      
      hilog.error(0x0000, TAG, `Router error: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_006`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：跳转页面压入页面数超过32，返回错误码100003`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：连续push超过32个页面`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：第33个页面push失败，返回错误码100003`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        if (this.errorCode) {
          Text(`错误码：${this.errorCode}`)
            .fontSize(12)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
            .width('100%')
        }

        Text(`当前已push页面数：${this.pushCount}`)
          .fontSize(12)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Button('开始测试\n（连续push 35次）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            await this.pushMultiplePages();
          })

        Button('清空页面栈')
          .id('btn_clear')
          .width('90%')
          .backgroundColor(Color.Orange)
          .margin({ top: 10 })
          .onClick(() => {
            router.clear();
            this.pushCount = 0;
            this.statusInfo = '页面栈已清空';
            hilog.info(0x0000, TAG, 'Router stack cleared');
          })

        Text(`说明：错误码100003表示页面栈已满（超过32层）`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
          .margin({ top: 20 })
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

interface BusinessError {
  code: number;
  message: string;
}

