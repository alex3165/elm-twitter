const extractUrls = (text) => {
  return text.split(' ').reduce((acc, next) => {
    if (next.includes('http://') || next.includes('https://')) {
      acc.push(next);
    } else {
      const i = acc.length - 1;
      acc[i] = acc[i] + ' ' + next;
    }

    return acc;
  }, ['']).map((t) => t.trim())
};

module.exports = {
  extractUrls
};
