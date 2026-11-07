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

/**
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0140
 * @tc.desc: 设置Column组件的backgroundImage为heif格式图片
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0140 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0140', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Column backgroundImage HEIF测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0140')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Column backgroundImage HEIF格式测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Column() {
          Text('资源图片')
            .fontSize(10)
            .fontColor('#FFFFFF')
        }
        .width('11.11%')
        .height('6.56%')
        .backgroundImage($r('app.media.icon'))
        .backgroundImageSize(ImageSize.Cover)
        .id('bg_resource')
        .margin({ right: 10 })

        Column() {
          Text('网络图片')
            .fontSize(10)
            .fontColor('#FFFFFF')
        }
        .width('11.11%')
        .height('6.56%')
        .backgroundImage(('https://' + 'example.com' + '/test.heic'))
        .backgroundImageSize(ImageSize.Cover)
        .id('bg_network')
        .margin({ right: 10 })
      }.margin({ bottom: 10 })

      Row() {
        Column() {
          Text('本地图片')
            .fontSize(10)
            .fontColor('#FFFFFF')
        }
        .width('11.11%')
        .height('6.56%')
        .backgroundImage($r('app.media.icon'))
        .backgroundImageSize(ImageSize.Cover)
        .id('bg_local')
        .margin({ right: 10 })

        Column() {
          Text('JPG图片')
            .fontSize(10)
            .fontColor('#FFFFFF')
        }
        .width('11.11%')
        .height('6.56%')
        .backgroundImage($r('app.media.icon'))
        .backgroundImageSize(ImageSize.Cover)
        .id('bg_jpg')
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 资源heif图片正常显示\n2. 网络heif图片显示正常\n3. 本地heif图片显示正常\n4. jpg格式背景图片正常显示')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

