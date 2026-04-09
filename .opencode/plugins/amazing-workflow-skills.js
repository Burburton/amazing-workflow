/**
 * Amazing Workflow Skills Plugin for OpenCode.ai
 *
 * Registers feature lifecycle skills for project governance.
 */

import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export const AmazingWorkflowSkillsPlugin = async ({ client, directory }) => {
  const skillsDir = path.resolve(__dirname, '../../.superpowers/skills');

  return {
    // Inject skills path into live config
    config: async (config) => {
      config.skills = config.skills || {};
      config.skills.paths = config.skills.paths || [];
      if (!config.skills.paths.includes(skillsDir)) {
        config.skills.paths.push(skillsDir);
      }
    }
  };
};