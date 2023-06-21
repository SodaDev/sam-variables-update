import {Context} from 'aws-lambda';
import {Logger} from '@aws-lambda-powertools/logger';
import {handlerLogic} from "./src/handler";

const logger = new Logger();

export const handler = async (event: any, context: Context): Promise<any> => {
    logger.info('Lambda invocation event', {event});
    logger.appendKeys({
        awsRequestId: context.awsRequestId,
    });

    try {
        return handlerLogic(event)
    } catch (err) {
        logger.error(`Error occurred: ${err}`, event);
        throw err;
    }

};

module.exports = { handler }