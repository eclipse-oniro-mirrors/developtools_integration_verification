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
import { image } from '@kit.ImageKit';
import { componentSnapshot } from '@kit.ArkUI';

@Entry
@Component
struct SnapshotAttribute190 {
  @State showGradient: boolean = false;

  build() {
    Column({ space: 20 }) {
      Text('Snapshot LinearGradient Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      // 显示区域 - 用于展示linearGradient效果
      Column() {
        Text('Linear Gradient Area')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width('41.67%')
      .height('16.39%')
      .linearGradient(this.showGradient ? {
        angle: 180,
        colors: [[0xff0000, 0.0], [0x00ff00, 0.5], [0x0000ff, 1.0]]
      } : undefined)
      .backgroundColor(this.showGradient ? undefined : Color.Gray)
      .id('gradient_area')

      Button('Snapshotlevel0_2')
        .onClick(() => {
          console.info('Snapshotlevel0_2 button clicked');
        })
        .id('btn_level')

      Button('linearGradient')
        .onClick(() => {
          // 设置linearGradient属性
          this.showGradient = true;
          console.info('LinearGradient applied');
        })
        .id('btn_gradient')

      Button('get promise')
        .onClick(async () => {
          // 使用Promise方式截图
          try {
            const pixelMap = await componentSnapshot.get('gradient_area');
            console.info('Snapshot get promise success');
          } catch (error) {
            console.error('Snapshot get promise failed: ' + error);
          }
        })
        .id('btn_promise')

      Button('get callback')
        .onClick(() => {
          // 使用Callback方式截图
          componentSnapshot.get('gradient_area', (error, pixelMap) => {
            if (error) {
              console.error('Snapshot get callback failed: ' + error);
            } else {
              console.info('Snapshot get callback success');
            }
          });
        })
        .id('btn_callback')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}

