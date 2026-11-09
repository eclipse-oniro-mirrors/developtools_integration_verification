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
struct VideoOptimize15 {
  @State statusMsg: string = '等待onPrepared事件触发...';
  @State videoStatus: 'idle' | 'loading' | 'success' | 'error' = 'idle';
  @State eventHistory: string[] = [];
  @State duration: number = 0;
  @State isHidden: boolean = true;

  getStatusText(): string {
    switch (this.videoStatus) {
      case 'idle': return '空闲';
      case 'loading': return '加载中';
      case 'success': return '成功';
      case 'error': return '错误';
      default: return '未知';
    }
  }

  addEvent(event: string) {
    this.eventHistory.push(`${new Date().toLocaleTimeString()}: ${event}`);
    if (this.eventHistory.length > 5) {
      this.eventHistory.shift();
    }
  }

  build() {
    Column() {
      // 页面标题
      Row() {
        Text('👁️')
          .fontSize(32)
          .margin({ right: 12 })
        
        Column() {
          Text('Video组件隐藏状态onPrepared事件测试')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2C3E50')
          
          Text('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0150')
            .fontSize(14)
            .fontColor('#7F8C8D')
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ bottom: 24 })

      // 视频播放区域
      Column() {
        Video({
          src: $rawfile('video1.mp4')
        })
          .id('video_15')
          .width('100%')
          .height(300)
          .borderRadius(12)
          .shadow({
            radius: 8,
            color: '#1F000000',
            offsetX: 0,
            offsetY: 4
          })
          .visibility(Visibility.Hidden)
          .onPrepared((e?: PreparedInfo) => {
            console.info('Video onPrepared: ' + JSON.stringify(e));
            this.statusMsg = `✅ onPrepared事件触发!\\n时长: ${e?.duration}秒`;
            this.videoStatus = 'success';
            this.duration = e?.duration || 0;
            this.addEvent('隐藏视频onPrepared事件触发');
          })
          .onError(() => {
            this.statusMsg = '❌ 视频加载失败';
            this.videoStatus = 'error';
            this.addEvent('隐藏视频加载失败');
          })

        // 视频状态指示器
        Row() {
          Circle({ width: 12, height: 12 })
            .fill(this.videoStatus === 'success' ? '#27AE60' : 
                  this.videoStatus === 'error' ? '#E74C3C' : 
                  this.videoStatus === 'loading' ? '#F39C12' : '#BDC3C7')
            .margin({ right: 8 })
          
          Text(`视频状态: ${this.getStatusText()}`)
            .fontSize(14)
            .fontColor('#34495E')
        }
        .margin({ top: 12 })
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({
        radius: 12,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 6
      })
      .margin({ bottom: 24 })

      // 隐藏状态信息显示
      Column() {
        Text('📊 隐藏状态信息')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Row() {
          Column() {
            Text('隐藏状态')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(this.isHidden ? '已隐藏' : '可见')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.isHidden ? '#95A5A6' : '#27AE60')
          }
          .layoutWeight(1)

          Column() {
            Text('视频状态')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(this.getStatusText())
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.videoStatus === 'success' ? '#27AE60' : 
                        this.videoStatus === 'error' ? '#E74C3C' : '#3498DB')
          }
          .layoutWeight(1)

          Column() {
            Text('视频时长')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(`${Math.floor(this.duration)}秒`)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#9B59B6')
          }
          .layoutWeight(1)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 4
      })
      .margin({ bottom: 24 })

      // 事件历史记录
      Column() {
        Text('📝 事件历史')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Text(this.eventHistory.length > 0 ? this.eventHistory.join('\\n') : '暂无事件记录')
          .fontSize(14)
          .fontColor('#5D6D7E')
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .width('100%')
          .padding(16)
          .backgroundColor('#F8F9FA')
          .borderRadius(8)
          .border({ width: 1, color: '#E9ECEF' })
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 4
      })
      .margin({ bottom: 24 })

      // 事件日志显示区域
      Column() {
        Text('📋 事件日志')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Text(this.statusMsg)
          .fontSize(14)
          .fontColor('#2C3E50')
          .textAlign(TextAlign.Center)
          .width('100%')
          .padding(16)
          .backgroundColor('#F8F9FA')
          .borderRadius(8)
          .border({ width: 1, color: '#E9ECEF' })
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 4
      })
      .margin({ bottom: 24 })

      // 测试说明
      Column() {
        Text('📋 测试说明')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Text('1. 观察视频的隐藏状态\\n2. 等待隐藏视频的onPrepared事件自动触发\\n3. 查看事件日志中的详细信息\\n4. 观察视频状态指示器的变化\\n5. 检查事件历史记录')
          .fontSize(14)
          .fontColor('#5D6D7E')
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .width('100%')
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 4
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
