# SCareGPT
Tool configuration information and experimental datasets for the paper 'Knowledge Retrieval-Based GPT for Smart Contract Auditing: Enhancing Security through Advanced Analysis'
## Tool_Configuration
- The Configuration.json contains the specific configuration information for SCareGPT. Users can replicate the experiments described in the article according to this file, or they can further improve and perfect their own Assistant.
- The Knowledge_Base folder contains all the SWC documentation, as well as the SWC.md file used in the article, which integrates information on 10 types of vulnerabilities.
## Dataset
- The dataset_without_annotation folder contains 100 Solidity smart contracts, each illustrating one of ten types of vulnerabilities, with all comments removed.
- The contracts in the dataset_time folder have been selected for efficiency testing of SCareGPT.
### Labelled dataset:
<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Type</th>
      <th>Description</th>
      <th>Number</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Reentrancy</td>
      <td>This vulnerability occurs when a contract calls an external contract, and the called contract then calls back into the calling contract before the first invocation is finished. </td>
      <td>10</td>   
    </tr>
    <tr>
      <th>1</th>
      <td>Arithmetic</td>
      <td>This occurs when an arithmetic opera- tion generates a value that exceeds the range that can be represented within the fixed number of bits designated for integers in the EVM. </td>
      <td>10</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Unchecked send</td>
      <td>This vulnerability happens when the call fails accidentally or an attacker forces the call to fail. It is also described as ``unhandled exceptions``, ``exception disorder``, or ``unchecked low-level call``.</td>
      <td>10</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Unsafe delegatecall</td>
      <td>This vulnerability rises from the DELEGATECALL instruction, which allows a contract to dynamically load code from another contract at runtime.</td>
      <td>10</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Transaction Ordering Dependence</td>
      <td>This vulnerability, is also described as TOD, arises when a contract’s behaviour depends on the order of transactions.</td>
      <td>10</td>
    </tr>
      <tr>
      <th>5</th>
      <td>Time manipulation</td>
      <td>This vulnerability arises when smart contracts rely on the timestamp information from blocks.</td>
      <td>10</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Bad randomness</td>
      <td>This vulnerability pertains to the flawed generation of random numbers within smart contracts. Random numbers often influence the decisions or outcomes of contract functionalities. </td>
      <td>10</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Authorization through tx.origin</td>
      <td>This vulnerability arises when the tx.origin variable is exploited by attackers. </td>
      <td>10</td>
    </tr>
      <tr>
      <th>8</th>
      <td>Unsafe suicidal</td>
      <td>This vulnerability manifests when the SELFDESTRUCT function is improperly secured and subsequently exploited by attackers. </td>
      <td>10</td>
    </tr>
        <tr>
      <th>9</th>
      <td>Gasless send</td>
      <td>This vulnerability occurs when there’s an insufficient amount of gas to carry out an external call, resulting in the reversion of the transaction.</td>
      <td>10</td>
  </tbody>
</table>
</div>
