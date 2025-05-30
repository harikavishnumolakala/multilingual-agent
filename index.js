const dasha = require("@dasha.ai/sdk");

(async () => {
  const app = await dasha.deploy("./app", { concurrency: 1 });

  app.setLogger({ level: "info" });
  app.audio.enabled = true;
  app.audio.recordingEnabled = true;

  await app.start();

  const conv = app.createConversation({});
  await conv.execute();

  await app.stop();
})();
